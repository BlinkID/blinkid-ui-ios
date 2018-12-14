//
//  MBBlinkResults.swift
//  BlinkID-app
//
//  Created by Dino Gustin on 24/08/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBResultManager {
    private var _resultEntries: [MBFieldResult] = [MBFieldResult]()
    private var _shouldValidate: Bool = MBBlinkSettings.sharedInstance.shouldValidateDocuments
    private var _faceImage: UIImage?
    private var _signatureImage: UIImage?
    private var _firstSideDocumentImage: UIImage?
    private var _secondSideDocumentImage: UIImage?
    private let _resultValidator: MBResultValidator

    init(withValidator validator: MBResultValidator) {
        _resultValidator = validator
    }

    public var isValid: Bool {
        guard _shouldValidate else { return true }
        _resultValidator.match(results: _resultEntries)
        return _resultValidator.isResultValid
    }

    public func extractResult(fromRecognizer recognizerWrapper: MBRecognizerWrapper, state: MBScanState) -> MBRecognitionResult? {

        _extractImages(recognizerWrapper: recognizerWrapper, state: state)
        
        guard let recognizer = recognizerWrapper.getRecognizer() else {
            fatalError("No recognizer was provided")
        }
        let title = recognizer.resultTitle
        _resultEntries.append(recognizer)

        var combinedEntries = [MBField]()

        for resultEntry in _resultEntries {
            if let fields = resultEntry.extractFieldResults() as? [MBField] {
                combinedEntries.append(contentsOf: fields)
            }
        }

        let recognitionResult = MBRecognitionResult(resultTitle: title,
                                                    resultEntries: combinedEntries,
                                                    frontSideDocumentImage: _firstSideDocumentImage,
                                                    backSideDocumentImage: _secondSideDocumentImage,
                                                    faceImage: _faceImage,
                                                    signatureImage: _signatureImage)

        return recognitionResult
    }

    private func _extractImages(recognizerWrapper: MBRecognizerWrapper, state: MBScanState) {
        if (state != .backSide || recognizerWrapper.getRecognizer() is MBCombinedRecognizer),
            let front = recognizerWrapper.frontImage() {
            _firstSideDocumentImage = front
        }
        
        if state == .backSide,
            let back = recognizerWrapper.backImage() {
            _secondSideDocumentImage = back
        }

        if _faceImage == nil {
            _faceImage = recognizerWrapper.faceImage()
        }
        
        if _signatureImage == nil {
            _signatureImage = recognizerWrapper.signatureImage()
        }
    }
}
