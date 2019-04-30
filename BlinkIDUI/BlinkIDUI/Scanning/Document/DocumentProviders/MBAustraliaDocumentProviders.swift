//
//  MBAustraliaDocumentProviders.swift
//  BlinkIDUI
//
//  Created by Jura Skrlec on 15/04/2019.
//  Copyright © 2019 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBAustraliaDLDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBAustraliaDlFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBAustraliaDlBackRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.victoriaDriverLicense
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}
