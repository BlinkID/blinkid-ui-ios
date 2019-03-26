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
        return MBRecognizerWrapper(withRecognizer: MBBruneiIdBackRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}

class MBBruneiTemporaryResidencePermitDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiTemporaryResidencePermitFrontRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiTemporaryResidencePermitBackRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.temporaryResidencePermit
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}

class MBBruneiResidencePermitDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiResidencePermitFrontRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiResidencePermitBackRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.residencePermit
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}

class MBBruneiMilitaryIdDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiMilitaryIdFrontRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBBruneiMilitaryIdBackRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.militaryIDDefault
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}
