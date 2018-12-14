//
//  MBRecognizerSetup.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 02/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBRecognizerWrapper: NSObject {

    private var _recognizer: MBRecognizer?
    private var _combinedRecognizer: MBCombinedRecognizer?
    private var _documentImageRecognizer: MBDocumentDetectorRecognizer?

    var shouldPauseBeforeScanning: Bool {
        return _documentImageRecognizer != nil
    }
    
    init(withRecognizer recognizer: MBRecognizer) {
        recognizer.setupRecognizer()
        _recognizer = recognizer
    }

    init(withCombinedRecognizer combinedRecognizer: MBCombinedRecognizer) {
        if let recognizer = combinedRecognizer as? MBRecognizer {
            recognizer.setupRecognizer()
        }
        _combinedRecognizer = combinedRecognizer
    }
    
    init(withDocumentDetector documentDetector: MBDocumentDetectorRecognizer) {
        _documentImageRecognizer = documentDetector
    }
    
    func getRecognizer() -> MBRecognizer? {
        if let recognizer = _recognizer {
            return recognizer
        }

        if let recognizer = _documentImageRecognizer?.recognizer() {
            return recognizer
        }

        if let combinedRecognizer = _combinedRecognizer as? MBRecognizer {
            return combinedRecognizer
        }
        
        return nil
    }
    
    func faceImage() -> UIImage? {
        if let result = _combinedRecognizer?.combinedResult as? MBFaceImageResult {
            return result.faceImage?.image
        }
        
        if let result = _recognizer?.baseResult as? MBFaceImageResult {
            return result.faceImage?.image
        }
        
        return nil
    }
    
    func signatureImage() -> UIImage? {
        if let result = _combinedRecognizer?.combinedResult as? MBSignatureImageResult {
            return result.signatureImage?.image
        }
        
        if let result = _recognizer?.baseResult as? MBSignatureImageResult {
            return result.signatureImage?.image
        }
        
        return nil
    }
    
    func frontImage() -> UIImage? {
        if let result = _combinedRecognizer?.combinedResult as? MBCombinedFullDocumentImageResult {
            return result.fullDocumentFrontImage?.image
        }
        
        if let result = _recognizer?.baseResult as? MBFullDocumentImageResult {
            return result.fullDocumentImage?.image
        }
        
        if let image = _documentImageRecognizer?.fullDocumentImage()?.image {
            return image
        }
        
        return nil
    }
    
    func backImage() -> UIImage? {
        if let result = _combinedRecognizer?.combinedResult as? MBCombinedFullDocumentImageResult {
            return result.fullDocumentBackImage?.image
        }
        
        if let result = _recognizer?.baseResult as? MBFullDocumentImageResult {
            return result.fullDocumentImage?.image
        }
        
        if let image = _documentImageRecognizer?.fullDocumentImage()?.image {
            return image
        }
        
        return nil
    }

}
