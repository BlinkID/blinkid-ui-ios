//
//  MBRecognizerManager.swift
//  MicroBlinkUI
//
//  Created by Jure Čular on 08/10/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

// MARK: FrameGrabberMode

/// Enum that describes the type of frames that can be returned to the user through `MBBlinkDelegate`
@objc public enum MBFrameGrabberMode: Int {
    /// Neither current camera frame nor success frame will be returned
    case nothing
    /// Only success camera frames will be returned
    case successFrames
    /// Both current and success frames will be returned
    case allFrames
}

// MARK: MBRecognizerManager

class MBRecognizerManager {
    private var _resultManager: MBResultManager!

    private var _singleSideRecognizerWrappers = [MBScanState: MBRecognizerWrapper]()
    private var _combinedRecognizerWrapper: MBRecognizerWrapper?
    
    private var _singleSideSuccessFrameRecognizers = [MBScanState: MBSuccessFrameGrabberRecognizer]()
    private var _singleSideRecognizers = [MBScanState: MBRecognizer]()

    private var _combinedRecognizer: MBCombinedRecognizer?
    private var _combinedSuccessFrameRecognizers: MBSuccessFrameGrabberRecognizer?

    private let _frameGrabberMode: MBFrameGrabberMode

    var isResultValid: Bool {
        return _resultManager.isValid
    }
    
    // MARK: Initializer

    init(frameGrabberMode: MBFrameGrabberMode) {
        _frameGrabberMode = frameGrabberMode
    }
    
    // MARK: Public
    
    func scanningPauseTime(forState state: MBScanState) -> Double {
        if _singleSideRecognizerWrappers[state]?.shouldPauseBeforeScanning ?? false {
            return 3
        }
        return 0
    }
    
    func addRecognizer(documentProvider: MBDocumentProvider) {

        if let frontRecognizerProvider = documentProvider.frontRecognizerProvider {
            _singleSideRecognizerWrappers[.frontSide] = frontRecognizerProvider
            if let frontRecognizer = frontRecognizerProvider.getRecognizer() {
                _addFrontSideRecognizer(recognizer: frontRecognizer)
            }
        }

        if documentProvider.isTwoSided {
            if let combinedRecognizerProvider = documentProvider.combinedRecognizerProvider {
                _combinedRecognizerWrapper = combinedRecognizerProvider
                if let combinedRecognizer = combinedRecognizerProvider.getRecognizer() as? MBCombinedRecognizer {
                    _addCombinedRecognizer(recognizer: combinedRecognizer)
                }
            }

            if let backRecognizerProvider = documentProvider.backRecognizerProvider {
                _singleSideRecognizerWrappers[.backSide] = backRecognizerProvider
                if let backRecognizer = backRecognizerProvider.getRecognizer() {
                    _addBackSideRecognizer(recognizer: backRecognizer)
                }
            }
        }
        
        _resultManager = MBResultManager(withValidator: documentProvider.resultValidator)
    }

    func getRecognizerCollection(forState state: MBScanState) -> MBRecognizerCollection? {
        var recognzierList = [MBRecognizer]()

        if state == .anySide {
            if case .nothing = _frameGrabberMode {
                let recognizers = Array(_singleSideRecognizers.values)
                recognzierList = recognizers
            } else {
                let succesFrameGrabberRecognizers = Array(_singleSideSuccessFrameRecognizers.values)
                recognzierList = succesFrameGrabberRecognizers
            }
        } else {
            if case .nothing = _frameGrabberMode {
                if state == .frontSide,
                    let combinedRecognizer = _combinedRecognizer as? MBRecognizer {
                    recognzierList.append(combinedRecognizer)
                } else if let recognizer = _singleSideRecognizers[state] {
                    recognzierList.append(recognizer)
                }

            } else {
                if state == .frontSide,
                    let combinedSuccessFrameRecognizer = _combinedSuccessFrameRecognizers {
                    recognzierList.append(combinedSuccessFrameRecognizer)
                } else if let successFrameRecognizer = _singleSideSuccessFrameRecognizers[state] {
                    recognzierList.append(successFrameRecognizer)
                }
            }
        }

        if _frameGrabberMode == .allFrames,
            let frameGrabberRecognizerDelegate = MBBlinkSettings.sharedInstance.frameGrabberDelegate {
            let frameGrabberRecognizer = MBFrameGrabberRecognizer(frameGrabberDelegate: frameGrabberRecognizerDelegate)
            recognzierList.append(frameGrabberRecognizer)
        }

        return MBRecognizerCollection(recognizers: recognzierList)
    }
    
    func getValidResults(forState state: MBScanState) -> MBRecognitionResult? {
        if state != .anySide && state != .notStarted {
            if _singleSideRecognizers[state]?.baseResult?.resultState == .valid,
                let singleSideRecognizerWrapper = _singleSideRecognizerWrappers[state] {
                return _resultManager.extractResult(fromRecognizer: singleSideRecognizerWrapper, state: state)
            } else if _combinedRecognizer?.combinedResult.resultState == .valid,
                let combinedRecognizerWrapper = _combinedRecognizerWrapper {
                return _resultManager.extractResult(fromRecognizer: combinedRecognizerWrapper, state: state)
            }
        } else if state == .anySide,
            _singleSideRecognizers[.frontSide]?.baseResult?.resultState == .valid,
            let singleSideRecognizerWrapper = _singleSideRecognizerWrappers[.frontSide] {
            return _resultManager.extractResult(fromRecognizer: singleSideRecognizerWrapper, state: .frontSide)
        } else if state == .anySide,
            _singleSideRecognizers[.backSide]?.baseResult?.resultState == .valid,
            let singleSideRecognizerWrapper = _singleSideRecognizerWrappers[.backSide] {
            return _resultManager.extractResult(fromRecognizer: singleSideRecognizerWrapper, state: state)
        }
        return nil
    }

    func getSuccessFrame(forState state: MBScanState) -> UIImage? {
        if state != .anySide && state != .notStarted {
            if let successFrameGrabber = _combinedSuccessFrameRecognizers,
                successFrameGrabber.result.resultState == .valid {
                return successFrameGrabber.result.successFrame.image
            }

            if let successFrameGrabber = _singleSideSuccessFrameRecognizers[state],
                successFrameGrabber.result.resultState == .valid {
                return successFrameGrabber.result.successFrame.image
            }
        } else if state == .anySide,
            _singleSideSuccessFrameRecognizers[.frontSide]?.baseResult?.resultState == .valid {
            return _singleSideSuccessFrameRecognizers[.frontSide]?.result.successFrame.image
        } else if state == .anySide,
            _singleSideSuccessFrameRecognizers[.backSide]?.baseResult?.resultState == .valid {
            return _singleSideSuccessFrameRecognizers[.backSide]?.result.successFrame.image
        }

        return nil
    }

    func clear() {
        _singleSideRecognizerWrappers.removeAll()
        _combinedRecognizerWrapper = nil
        
        _singleSideSuccessFrameRecognizers.removeAll()
        _singleSideRecognizers.removeAll()
        _combinedRecognizer = nil
        _combinedSuccessFrameRecognizers = nil
    }

    // MARK: Private

    private func _addFrontSideRecognizer(recognizer: MBRecognizer) {
        _singleSideRecognizers[.frontSide] = recognizer
        guard case .nothing = _frameGrabberMode else {
            _singleSideSuccessFrameRecognizers[.frontSide] = MBSuccessFrameGrabberRecognizer(recognizer: recognizer)
            return
        }
    }

    private func _addBackSideRecognizer(recognizer: MBRecognizer) {
        _singleSideRecognizers[.backSide] = recognizer

        guard case .nothing = _frameGrabberMode else {
            _singleSideSuccessFrameRecognizers[.backSide] = MBSuccessFrameGrabberRecognizer(recognizer: recognizer)
            return
        }
    }

    private func _addCombinedRecognizer(recognizer: MBCombinedRecognizer) {
        _combinedRecognizer = recognizer

        guard case .nothing = _frameGrabberMode else {
           if  let combinedRecognizer = _combinedRecognizer as? MBRecognizer {
            _combinedSuccessFrameRecognizers = MBSuccessFrameGrabberRecognizer(recognizer: combinedRecognizer)
            }
            return
        }
    }

}
