//
//  MBBelgiumDocumentProviders.swift
//  BlinkIDUI
//
//  Created by Jura Skrlec on 21/08/2019.
//  Copyright © 2019 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBBelgiumIDDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBelgiumIdFrontRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBelgiumIdBackRecognizer())
    }
    
    override var combinedRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withCombinedRecognizer: MBBelgiumCombinedRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}
