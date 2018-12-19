//
//  MBBruneiDocumentProviders.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 19/12/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBBruneiIDDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiIdFrontRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}
