//
//  MBUKDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 30/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBUKDLDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        let recognizer: MBEudlRecognizer = MBEudlRecognizer()
        recognizer.country = .unitedKingdom
        return MBRecognizerWrapper(withRecognizer: recognizer)
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
