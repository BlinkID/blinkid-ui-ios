//
//  MBNigeriaDocumentProviders.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 20/12/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBNigeriaDLDocumentProvider: MBDocumentProvider {
    
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
