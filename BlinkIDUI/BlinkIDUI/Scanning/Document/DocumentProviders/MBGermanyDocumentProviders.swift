//
//  MBGermanyDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 09/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBGermanyDLDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        let recognizer: MBEudlRecognizer = MBEudlRecognizer()
        recognizer.country = .germany
        return MBRecognizerWrapper(withRecognizer: recognizer)
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBGermanyDlBackRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.driverLicense
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}

class MBGermanyIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBGermanyIdFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBGermanyIdBackRecognizer())
    }

    override var combinedRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withCombinedRecognizer: MBGermanyCombinedRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBGermanyIDOldDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBGermanyIdFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withDocumentDetector: MBDocumentDetectorD2VerticalRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.oldID
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id2
    }

}
