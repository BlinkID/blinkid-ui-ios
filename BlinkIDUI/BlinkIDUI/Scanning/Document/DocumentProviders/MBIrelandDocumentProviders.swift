//
//  MBIrelandDocumentProvider.swift
//  BlinkID-app
//
//  Created by Jure Čular on 25/10/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBIrelandDLDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBIrelandDlFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withDocumentDetector: MBDocumentDetectorD1Recognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.driverLicense
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}
