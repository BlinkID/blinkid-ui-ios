//
//  MBUSADocumentProviders.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 31/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBUSADLDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBUsdlRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.driverLicense
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}

class MBUSAIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBUsdlRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBUSAUnder21IDDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBUsdlRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.under21ID
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.verticalId
    }
    
    override var backSideAspectRatio: DocumentAspectRatio? {
        return DocumentAspectRatio.id1
    }
    
}
