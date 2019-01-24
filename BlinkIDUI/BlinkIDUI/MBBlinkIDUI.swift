//
//  MBBlinkIDUI.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 12/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

/// BlinkIDUI delegate protocol
/// Implement this protocol to be able to recieve the events from the `MBBlinkIDUI` instance
@objc public protocol MBBlinkDelegate: AnyObject {
    
    /// Function called everytime scanning is started:
    ///     - front side scanning started.
    ///     - back side scanning started.
    ///     - any side scanning started.
    @objc optional func didStartScanning(withState state: MBScanState)

    /// Event that reports that the scanning of the whole document:
    ///     - both front and back side
    ///     - any side
    /// was successfuly scanned.
    ///
    /// - Parameters:
    ///   - recognitionResult: recognition results obtained through scanning
    ///   - successFrame: if success or all frame retrieval was turned on success frame image is returned(camera frame containing the document)
    @objc func didScanEntireDocument(recognitionResult: MBRecognitionResult, successFrame: UIImage?)

    /// Event that reports that the scanning of the front side of the  document was successfuly scanned.
    ///
    /// - Parameters:
    ///   - recognitionResult: recognition results obtained through scanning
    ///   - successFrame: if success or all frame retrieval was turned on success frame image is returned(camera frame containing the document)
    @objc func didScanFirstSide(recognitionResult: MBRecognitionResult, successFrame: UIImage?)

    /// Event that reports that new document was selected for scanning and for what country is this document
    ///
    /// - Parameters:
    ///     - newDocument: document provider
    ///     - forCountry: country
    @objc optional func didChangeDocument(newDocument: MBDocumentProvider, forCountry country: MBCountry)
    
    /// Event called when user presses the X to close scaning button if it's available.
    @objc optional func didTapCancelButton()
    
}

/// Main container class, contains both `MBBlinkIdOverlayViewController` and `MBScanningProvider`.
/// `MBBlinkIdOverlayViewController` is used as the UI part of BlinkIDUI, while `MBScanningProvider` is the part
/// handling scanning logic.
///
/// To start scanning create an instance of MBBlinkIDUI and set it's delegate.
///
/// - Warning: Hold the reference to your instance of `MBBlinkIDUI` because it holds the reference to `MBScanningProvider` and `MBBlinkIdOverlayViewController`. If you lose the reference to it, scanning might work but you won't recieve the events.
@objc public class MBBlinkIDUI: NSObject {

    // MARK: - Public -
    
    /// Delegate used to send events made during scanning/ui interaction
    @objc public weak var delegate: MBBlinkDelegate?

    /// Property that contains the camera preview layer with the overlay(the UI)
    /// Present this to start the scanning process.
    @objc public var recognizerRunnerViewController: (UIViewController & MBRecognizerRunnerViewController)

    // MARK: - Private -

    private var _scanningProvider: MBScanningProvider
    private var _overlayViewController: MBBlinkIdOverlayViewController

    // MARK: - Initializer -

    /// Intializes the `MBBlinkIdOerlayViewController` and `MBScanningProvider` with the settings that were set through
    /// `MBBlinkSettings`.
    /// - Warning: Make sure to setup your settings in `MBBlinkSettings` and colors/fonts in `UIColor` and `UIFont`(properties have a prefix 'mb_') before creating MBBlinkIDUI instance.
    @objc public override init() {
        _scanningProvider = MBScanningProvider()

        _overlayViewController = MBBlinkIdOverlayViewController.initFromStoryboard()
        _overlayViewController.scanningRecognizerRunnerViewControllerDelegate = _scanningProvider
        _overlayViewController.metadataDelegates.firstSideFinishedRecognizerRunnerViewControllerDelegate = _scanningProvider

        recognizerRunnerViewController = MBViewControllerFactory.recognizerRunnerViewController(withOverlayViewController: _overlayViewController)
        
        super.init()
        
        _overlayViewController.delegate = self
        _scanningProvider.delegate = self
        MBBlinkSettings.sharedInstance.timeoutHandler.overlayViewController = _overlayViewController
        MBBlinkSettings.sharedInstance.invalidDocumentHandler.overlayViewController = _overlayViewController
    }

    // MARK: - Scanning Control -

    /// Restarts scanning
    @objc public func restartScanning() {
        // When scanning is restarted, timeout will be resumed through didStartScanning
        _scanningProvider.restartScanning()
    }

    /// Pauses scanning
    @objc public func pauseScanning() {
        // When scanning is paused, timeout should be stopped
        MBBlinkSettings.sharedInstance.timeoutHandler.onScanPaused()
        recognizerRunnerViewController.pauseScanning()
    }

    /// Resumes scanning
    @objc public func resumeScanning() {
        // When scanning is resumed, timeout should be started
        MBBlinkSettings.sharedInstance.timeoutHandler.onScanResumed()
      recognizerRunnerViewController.resumeScanningAndResetState(false)
    }
}

// MARK: - MBScanningProviderDelegate -

extension MBBlinkIDUI: MBScanningProviderDelegate {
    func didUpdate(recognizerCollection: MBRecognizerCollection) {
        _overlayViewController.reconfigureRecognizers(recognizerCollection)
    }

    func didStartScanning(withState state: MBScanState) {
        switch state {
        case .frontSide:
            // When first side scanning is starterd, timeout should be started
            MBBlinkSettings.sharedInstance.timeoutHandler.onScanStart()
            _overlayViewController.prepareUIForFrontSideScanning()
        case .backSide:
            // When back side starts scanning, timeout should be stopped
            MBBlinkSettings.sharedInstance.timeoutHandler.onScanDone()
            _overlayViewController.prepareUIForBackSideScanning()
        case .anySide:
            // When any side scanning is starterd, timeout should be started
            MBBlinkSettings.sharedInstance.timeoutHandler.onScanStart()
            _overlayViewController.prepareUIForAnySideScanning()
        case .notStarted:
            fatalError("Scanning started with state: notStarted, this shouldn't happen")
        }
        delegate?.didStartScanning?(withState: state)
    }

    func didFinishScanningFrontSideOfDocument(result: MBRecognitionResult, successFrame: UIImage?) {
        // When first side is done scanning, timeout should be stopped
        MBBlinkSettings.sharedInstance.timeoutHandler.onScanDone()
        delegate?.didScanFirstSide(recognitionResult: result, successFrame: successFrame)
    }

    func didFinishScanningWithResult(result: MBRecognitionResult, successFrame: UIImage?, validResults: Bool) {
        // When back/any side is done scanning, timeout should be stopped
        MBBlinkSettings.sharedInstance.timeoutHandler.onScanDone()
        // If invalid document is scanned show run invalid document handler
        if validResults {
            delegate?.didScanEntireDocument(recognitionResult: result, successFrame: successFrame)
        } else {
            MBBlinkSettings.sharedInstance.invalidDocumentHandler.onInvalidDocumentScanned()
        }
    }
}

// MARK: - MBBlinkIdOverlayViewControllerDelegate -

extension MBBlinkIDUI: MBBlinkIdOverlayViewControllerDelegate {
    func didChangeDocument(newDocument: MBDocumentProvider, forCountry country: MBCountry) {
        _scanningProvider.updated(scanningProviderFor: newDocument)
        delegate?.didChangeDocument?(newDocument: newDocument, forCountry: country)
    }
    
    func didTapCancelButton() {
        delegate?.didTapCancelButton?()
    }
}
