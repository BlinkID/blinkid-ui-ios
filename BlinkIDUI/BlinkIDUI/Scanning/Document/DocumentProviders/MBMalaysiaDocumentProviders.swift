//
//  MBMalaysiaDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 30/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBMalayasiaDLDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMalaysiaDlFrontRecognizer())
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

class MBMalaysiaIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMyKadFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMyKadBackRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

    override var resultValidator: MBResultValidator {
        return MBResultValidator(withMatchingKeys: [(MBFieldKey.dateOfBirth, MBFieldKey.dateOfBirth),
             (MBFieldKey.nricNumber, MBFieldKey.nricNumber)])
    }
}

class MBMalayasiaiKadDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMalaysiaIkadFrontRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.immigratorID
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBMalayasiaMyTenteraDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMalaysiaMyTenteraFrontRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.militaryID
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBMalaysiaPassportDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.passport
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id3
    }

}
