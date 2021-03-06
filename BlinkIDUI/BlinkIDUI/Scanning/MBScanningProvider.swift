//
//  MBScanningProvider.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 02/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

/// Enum that describes the current scanning state
@objc public enum MBScanState: Int {
    /// Scanning hasn't started
    case notStarted
    /// Scanning front side state
    case frontSide
    /// Scanning back side state
    case backSide
    /// Scanning any side state
    case anySide
}

protocol MBScanningProviderDelegate: AnyObject {
    func didStartScanning(withState state: MBScanState)

    func didFinishScanningFrontSideOfDocument(result: MBRecognitionResult, successFrame: UIImage?)

    func didFinishScanningWithResult(result: MBRecognitionResult, successFrame: UIImage?, validResults: Bool)

    func didUpdate(recognizerCollection: MBRecognizerCollection)
}

class MBScanningProvider: NSObject {
    private var _recognizerManager: MBRecognizerManager!

    private var _scanState: MBScanState = .notStarted

    private var _recognizerCollection: MBRecognizerCollection!

    private var _shouldScanBothSides: Bool {
        guard let documentProvider = self.documentProvider else {
            return false
        }
        return MBBlinkSettings.sharedInstance.shouldScanBothDocumentSides && documentProvider.isTwoSided
    }

    var documentProvider: MBDocumentProvider?

    weak var delegate: MBScanningProviderDelegate?

    // MARK: Initalizer

    required override init() {
        super.init()
        _recognizerManager = MBRecognizerManager(frameGrabberMode: MBBlinkSettings.sharedInstance.frameGrabberMode)
    }

    // MARK: Setup

    private func _setupScanningSettings() {
        guard let documentProvider = documentProvider else {
            return
        }

        _recognizerManager.clear()
        _recognizerManager.addRecognizer(documentProvider: documentProvider)
        
        if _shouldScanBothSides {
            _scanState = .frontSide
        } else {
            _scanState = .anySide
        }

        _updateRecognizers()
        
        delegate?.didStartScanning(withState: _scanState)
    }

    private func _updateRecognizers() {
        _recognizerCollection = _recognizerManager.getRecognizerCollection(forState: _scanState)
        _recognizerCollection.partialRecognitionTimeout = MBBlinkSettings.sharedInstance.partialRecognitionTimeout
        delegate?.didUpdate(recognizerCollection: _recognizerCollection)
    }

    // MARK: Scanning

    func isTwoSidedScanning() -> Bool {
        guard let documentProvider = self.documentProvider else {
            return false
        }
        return documentProvider.isTwoSided
    }

    func restartScanning() {
        _setupScanningSettings()
    }

    // MARK: - Public -

    func updated(scanningProviderFor newDocumentProvider: MBDocumentProvider) {
        documentProvider = newDocumentProvider
        _setupScanningSettings()
    }
}

extension MBScanningProvider: MBScanningRecognizerRunnerViewControllerDelegate {
    func recognizerRunnerViewController(_ recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController, didFinishScanningWith state: MBRecognizerResultState) {
        recognizerRunnerViewController.pauseScanning()
        DispatchQueue.main.async {
            guard recognizerRunnerViewController.isScanningPaused(),
                self._scanState != .notStarted,
                state == .valid else {
                    recognizerRunnerViewController.resumeScanningAndResetState(true)
                    self.restartScanning()
                    return
            }

            if self._scanState == .frontSide {
                self._firstSideScanned(recognizerRunnerViewController: recognizerRunnerViewController)
                let pauseTime = self._recognizerManager.scanningPauseTime(forState: self._scanState)
                
                // Usually needed for easy triggering recognizers like document recognizer
                if pauseTime > 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + pauseTime, execute: {
                        recognizerRunnerViewController.resumeScanningAndResetState(true)
                    })
                } else {
                    recognizerRunnerViewController.resumeScanningAndResetState(true)
                }
                
                self.delegate?.didStartScanning(withState: self._scanState)
            } else {
                self._anySideScanned(recognizerRunnerViewController: recognizerRunnerViewController)
                recognizerRunnerViewController.resumeScanningAndResetState(true)
            }
        }
    }

    private func _firstSideScanned(recognizerRunnerViewController: MBRecognizerRunnerViewController) {
        guard let recognitionResult = _recognizerManager.getValidResults(forState: _scanState)
        else { return }

        if MBBlinkSettings.sharedInstance.shouldPlayScanSound {
            recognizerRunnerViewController.playScanSuccessSound()
        }

        let successFrame = _recognizerManager.getSuccessFrame(forState: _scanState)

        _scanState = .backSide

        delegate?.didFinishScanningFrontSideOfDocument(result: recognitionResult, successFrame: successFrame)

        _updateRecognizers()
    }

    private func _anySideScanned(recognizerRunnerViewController: MBRecognizerRunnerViewController) {
        guard let recognitionResult = _recognizerManager.getValidResults(forState: _scanState)
        else { return }

        if MBBlinkSettings.sharedInstance.shouldPlayScanSound {
            recognizerRunnerViewController.playScanSuccessSound()
        }

        let successFrame = _recognizerManager.getSuccessFrame(forState: _scanState)

        _scanState = .notStarted

        delegate?.didFinishScanningWithResult(result: recognitionResult, successFrame: successFrame, validResults: _recognizerManager.isResultValid)

    }
}

extension MBScanningProvider: MBFirstSideFinishedRecognizerRunnerViewControllerDelegate {
    func recognizerRunnerViewControllerDidFinishRecognition(ofFirstSide recognizerRunnerViewController: UIViewController & MBRecognizerRunnerViewController) {
        
        if MBBlinkSettings.sharedInstance.shouldPlayScanSound {
            recognizerRunnerViewController.playScanSuccessSound()
        }

        let successFrame = _recognizerManager.getSuccessFrame(forState: _scanState)
        delegate?.didFinishScanningFrontSideOfDocument(result: MBRecognitionResult(resultTitle: "", resultEntries: [MBField](), frontSideDocumentImage: nil, backSideDocumentImage: nil, faceImage: nil, signatureImage: nil), successFrame: successFrame)
        _scanState = .backSide
        DispatchQueue.main.async {
            self.delegate?.didStartScanning(withState: self._scanState)
        }
    }

}
