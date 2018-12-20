//
//  MBCyprusDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jure Čular on 24/10/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBCyprusIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBCyprusIdFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBCyprusIdBackRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBCyprusIDOldDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBCyprusOldIdFrontRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBCyprusOldIdBackRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.oldID
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}
