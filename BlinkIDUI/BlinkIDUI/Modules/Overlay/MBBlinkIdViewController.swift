//
//  MBBlinkIdViewController.swift
//  BlinkID-app
//
//  Created by Dino Gustin on 27/08/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

private enum MBTorchState {
    case on
    case off
    case noTorch
}

private enum MBGlareState {
    case detected(messageBeforeGlare: String?)
    case finishedAnimating(messageBeforeGlare: String?)
    case animatingBack
    case noGlare
}

/// Protocol that is used to send events by `MBBlinkIdOverlayViewController` ot it's delegate.
protocol MBBlinkIdOverlayViewControllerDelegate: AnyObject {
    /// Event sent when the user selects a document, this document may be already selected but the event is send non the less.
    ///
    /// - Parameters
    ///     - newDocument: `MBDocumentProvider` instance that describes the recognizers used by the selected document
    ///     - forCountry: the country this document is being scanned for
    func didChangeDocument(newDocument: MBDocumentProvider, forCountry country: MBCountry)
    
    /// Event sent once the user taps Cancel(`X`) button.
    func didTapCancelButton()
}

/// `MBBlinkIdOverlayViewController` contains the UI of `BlinkIDUI` module.
/// It contains UI components that guide user through scanning process.
/// Main components are:
/// - Viewfinder is a simple frame which points the user toward the area where card should be presented, concrete implementation in in `MBViewfinderView`
/// - `DocumentSelection` storyboard which presents the user with a way to change the type of document they are scanning.
/// - Buttons to turn on/off the torch and dismiss the `BlinkIDUI` view controller.
///
/// - Note: Most of the UI aspects are customizable either by changing the properties defined through extensions of `UIFont` and `UIColor` presented in `MBTheme` file, or by changing the various properties through `MBBlinkSettings` sharedInstance.
public class MBBlinkIdOverlayViewController: MBCustomOverlayViewController {

    weak var delegate: MBBlinkIdOverlayViewControllerDelegate?

    // MARK: - Outlets -
    weak var documentChooserViewController: MBDocumentChooserViewController?

    @IBOutlet private weak var _documentSelectionContainer: UIView!
    @IBOutlet private weak var _documentSelectionBottom: NSLayoutConstraint!
    @IBOutlet private weak var _viewfinderAspectRatio: NSLayoutConstraint!
    @IBOutlet private weak var _messageLabel: UILabel! {
        didSet {
            _messageLabel.textColor = UIColor.mb_secondaryColor
            _messageLabel.font = UIFont.mb_messageLabelFont
        }
    }
    @IBOutlet private weak var _shadowView: MBShadowView!
    @IBOutlet private weak var _viewfinderView: MBViewfinderView!
    @IBOutlet private weak var _torchButton: UIButton! {
        didSet {
            _torchButton.tintColor = UIColor.mb_secondaryColor
        }
    }
    @IBOutlet private weak var _cancelButton: UIButton! {
        didSet {
            _cancelButton.tintColor = UIColor.mb_secondaryColor
        }
    }
    
    private var _torchState: MBTorchState = .off {
        didSet {
            switch _torchState {
            case .off:
                _torchButton.isSelected = false
                recognizerRunnerViewController?.willSetTorch(on: false)
            case .on:
                _torchButton.isSelected = true
                recognizerRunnerViewController?.willSetTorch(on: true)
            case .noTorch:
                _torchButton.isHidden = true
            }
        }
    }
    
    private var _glareState: MBGlareState = .noGlare

    private var _dotsResultSubview: MBDotsResultSubview!
    
    private var _shouldAnimateDocumentChooser: Bool = true

    // MARK: - Initalizer -

    /// Initializes the viewcontroller defined in `MBBlinkIDOverlay.storyboard`.
    public class func initFromStoryboard() -> MBBlinkIdOverlayViewController {
        let storyboard = UIStoryboard(name: MBConstants.Name.OverlayViewController.storyboard, bundle: Bundle(for: self))
        guard let viewController = storyboard.instantiateViewController(withIdentifier: MBConstants.Name.OverlayViewController.blinkIdIdentifier) as? MBBlinkIdOverlayViewController else {
            fatalError("Unable to instantiate viewController \(MBConstants.Name.OverlayViewController.blinkIdIdentifier) from storyboard \(MBConstants.Name.OverlayViewController.storyboard)")
        }
        return viewController
    }

    /// ViewController is defined through storyboard, do not use this initializer
    ///
    /// - Parameters:
    ///   - recognizerCollection: `MBRecognizerCollection` instance
    ///   - cameraSettings: `MBCameraSettings` instance
    private override init(recognizerCollection: MBRecognizerCollection, cameraSettings: MBCameraSettings) {
        fatalError("Use initFromStoryboard() to initialize MBBlinkIdOverlayViewController")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Lifecycle -

    override public func viewDidLoad() {
        super.viewDidLoad()
        _setup()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if _shouldAnimateDocumentChooser {
            _animateDocumentSelectionViewContrller()
        }
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(_applicationWillResignActive(notification:)),
            name: UIApplication.willResignActiveNotification,
            object: UIApplication.shared
        )
    }
    
    // Remove observer that was added in viewWillAppear
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if _torchState != .noTorch {
            _torchState = .off
        }
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        _shadowView.scanningRect = _viewfinderView.frame
        _shadowView.frame = view.frame
        _shadowView.setNeedsDisplay(_shadowView.frame)
    }

    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let documentChooserViewController = segue.destination as?  MBDocumentChooserViewController {
            self.documentChooserViewController = documentChooserViewController
            documentChooserViewController.delegate = self
        }
    }

    // MARK: - Setup -

    private func _setup() {
        // Setup documentSelectionContainer for entry animation
        _documentSelectionBottom.constant = -_documentSelectionContainer.frame.height

        _shadowView.scanningRect = _viewfinderView.frame
        _viewfinderView.startScanLineAnimation()

        _dotsResultSubview = MBDotsResultSubview(frame: view.frame)
        view.addSubview(_dotsResultSubview)

        metadataDelegates.glareRecognizerRunnerViewControllerDelegate = self
        metadataDelegates.detectionRecognizerRunnerViewControllerDelegate = self

        let settings = MBBlinkSettings.sharedInstance
        
        _torchButton.isHidden = !settings.shouldShowTorchButton
        _cancelButton.isHidden = !settings.shouldShowCancelButton
        
        if !(recognizerRunnerViewController?.overlayViewControllerShouldDisplayTorch(self) ?? false) {
            _torchState = .noTorch
        }
    }

    private func _setupViewfinderAspectRation(aspectRatio: CGFloat) {
        let aspectRatioConstraint = _viewfinderView.widthAnchor.constraint(equalTo: _viewfinderView.heightAnchor, multiplier: aspectRatio)
        _viewfinderView.removeConstraint(_viewfinderAspectRatio)
        _viewfinderAspectRatio = aspectRatioConstraint
        aspectRatioConstraint.isActive = true
    }

    // MARK: - Public -

    func prepareUIForAnySideScanning() {
        _animateMessageLabel(text: MBBlinkSettings.sharedInstance.languageSettings.scanAnySideMessageText)
    }

    func prepareUIForFrontSideScanning() {
        _animateMessageLabel(text: MBBlinkSettings.sharedInstance.languageSettings.scanFrontSideMessageText)
    }

    func prepareUIForBackSideScanning() {
        _animateMessageLabel(text: MBBlinkSettings.sharedInstance.languageSettings.scanBackSideMessageText)
        _viewfinderView.startFlipAnimation()
    }

    // MARK: - Animations -

    private func _animateMessageLabel(text: String?, delay: TimeInterval = 0.0) {
        switch _glareState {
        case .noGlare:
            break
        default:
            _messageLabel.layer.removeAllAnimations()
            _glareState = .noGlare
        }

        DispatchQueue.main.async {
            UIView.animate(withDuration: MBConstants.Animation.OverlayViewController.messageLabelAnimationTime, delay: delay, options: .curveEaseInOut, animations: {
                self._messageLabel.alpha = MBConstants.Animation.OverlayViewController.messageLabelAlphaEnd
            }, completion: { _ in
                self._messageLabel.text = text
                UIView.animate(withDuration: MBConstants.Animation.OverlayViewController.messageLabelAnimationTime, animations: {
                    self._messageLabel.alpha = MBConstants.Animation.OverlayViewController.messageLabelAlphaBegin
                })
            })
        }
    }
    
    private func _animateGlareMessage(toText text: String?, finalGlareState state: MBGlareState, delay: TimeInterval = 0.0) {
        _messageLabel.layer.removeAllAnimations()
        DispatchQueue.main.async {
            UIView.animate(withDuration: MBConstants.Animation.OverlayViewController.messageLabelAnimationTime, delay: delay, options: .curveEaseInOut, animations: {
                self._messageLabel.alpha = MBConstants.Animation.OverlayViewController.messageLabelAlphaEnd
            }, completion: { _ in
                self._messageLabel.text = text
                UIView.animate(withDuration: MBConstants.Animation.OverlayViewController.messageLabelAnimationTime, animations: {
                    self._messageLabel.alpha = MBConstants.Animation.OverlayViewController.messageLabelAlphaBegin
                }, completion: { _ in
                    self._glareState = state
                })
            })
        }
    }

    private func _animateDocumentSelectionViewContrller() {
        _shouldAnimateDocumentChooser = false
        UIView.animate(withDuration: MBConstants.Animation.OverlayViewController.messageLabelAnimationTime, animations: {
            self._documentSelectionBottom.constant = 0
            self.view.layoutIfNeeded()
        })
    }

    // MARK: - Torch button -

    @IBAction private func _didTapTorchButton(_ sender: Any) {
        if _torchState == .on {
            _torchState = .off
        } else if _torchState == .off {
            _torchState = .on
        }
    }
    
    @IBAction private func _didTapCancelButton(_ sender: Any) {
        delegate?.didTapCancelButton()
    }
    
    @objc private func _applicationWillResignActive(notification: NSNotification) {
        if _torchState != .noTorch {
            _torchState = .off
        }
    }
}

// MARK: - MBDocumentPickerViewControllerDelegate -

extension MBBlinkIdOverlayViewController: MBDocumentChooserViewControllerDelegate {
    func didSelect(document: MBDocumentType, fromCountry country: MBCountry) {
        guard let documentProvider = country.countryProvider.documentProviders[document] else { return }
        _animateAspectRatioChange(aspectRatio: documentProvider.aspectRatio.ratio)
        delegate?.didChangeDocument(newDocument: documentProvider, forCountry: country)
    }

    private func _animateAspectRatioChange(aspectRatio: CGFloat) {
        _setupViewfinderAspectRation(aspectRatio: aspectRatio)
        UIView.animate(withDuration: MBConstants.Animation.OverlayViewController.viewfinderChangeAnimationTime, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

extension MBBlinkIdOverlayViewController: MBGlareRecognizerRunnerViewControllerDelegate {
    public func recognizerRunnerViewController(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController, didFinishGlareDetectionWithResult glareFound: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if glareFound,
                case .noGlare = self._glareState {
                    self._glareState = .detected(messageBeforeGlare: self._messageLabel.text)
                    self._animateGlareMessage(
                        toText: MBBlinkSettings.sharedInstance.languageSettings.glareMessageText,
                        finalGlareState: .finishedAnimating(messageBeforeGlare: self._messageLabel.text))
            } else if !glareFound,
                case .finishedAnimating(messageBeforeGlare: let message) = self._glareState {
                self._glareState = .animatingBack
                    self._animateGlareMessage(toText: message, finalGlareState: .noGlare, delay: MBConstants.Animation.OverlayViewController.messageLabelAnimationDelayTime)
            }
        }
    }
}

extension MBBlinkIdOverlayViewController: MBDetectionRecognizerRunnerViewControllerDelegate {
    public func recognizerRunnerViewController(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController, didFinishDetectionWithDisplayablePoints displayablePoints: MBDisplayablePointsDetection) {
        DispatchQueue.main.async {
            self._dotsResultSubview.detectionFinished(withDisplayablePoints: displayablePoints)
        }
    }
}
