//
//  MBSwitzerlandDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 31/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBSwitzerlandDLDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBSwitzerlandDlFrontRecognizer())
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

class MBSwitzerlandIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBSwitzerlandIdFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBSwitzerlandIdBackRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

    override var resultValidator: MBResultValidator {
        return MBResultValidator(withMatchingKeys: [(MBFieldKey.dateOfBirth, MBFieldKey.dateOfBirth)])
    }
}

class MBSwitzerlandPassportDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBSwitzerlandPassportRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.passport
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id3
    }

}
