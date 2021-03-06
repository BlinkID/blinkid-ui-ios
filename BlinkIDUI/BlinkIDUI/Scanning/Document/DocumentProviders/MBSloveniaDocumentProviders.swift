//
//  MBSloveniaDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 30/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBSloveniaIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBSloveniaIdFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBSloveniaIdBackRecognizer())
    }

    override var combinedRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withCombinedRecognizer: MBSloveniaCombinedRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}
