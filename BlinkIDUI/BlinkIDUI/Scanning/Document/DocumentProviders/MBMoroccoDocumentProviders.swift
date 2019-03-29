//
//  MBMoroccoDocumentProviders.swift
//  BlinkID-app
//
//  Created by Jure Čular on 24/10/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBMoroccoIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMoroccoIdFrontRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMoroccoIdBackRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

    override var resultValidator: MBValidatorProtocol {
        return MBSingleSideValidatorBuilder()
            .addMatchingPair(frontSideKey: MBFieldKey.documentNumber, backSideKey:
                MBFieldKey.documentNumber)
            .addMatchingPair(frontSideKey: MBFieldKey.dateOfExpiry, backSideKey: MBFieldKey.dateOfExpiry)
            .addMatchingPair(frontSideKey: MBFieldKey.sex, backSideKey: MBFieldKey.sex)
            .build()
    }
}
