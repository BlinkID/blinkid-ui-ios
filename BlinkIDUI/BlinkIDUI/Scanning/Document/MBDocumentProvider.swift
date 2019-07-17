//
//  MBDocumentProvider.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 27/09/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

enum DocumentAspectRatio: Int {
    case id1
    case id2
    case id3
    case unknown

    var ratio: CGFloat {
        switch self {
        case .id1:
            return 85.6 / 53.98
        case .id2:
            return 105.0 / 74.0
        case .id3:
            return 125.0 / 88.0
        case .unknown:
            return 0
        }
    }
}

/// Class that describes a document provider
/// It is used to describe what parts of the document can be scanned,
/// what `MBRecognizer`s, what type of document this...
public class MBDocumentProvider: NSObject {
    
    /// Property that is used to tell if the document is fully supported, ie. is in beta
    public final let isFullySupported: Bool
    
    /// Property that is used to tell if front and back side of the document can be scanned or just one side.
    /// Value will return true, if either front and back recognizer providers are specified or a combined recognizer provider is specified
    final var isTwoSided: Bool { return (frontRecognizerProvider != nil && backRecognizerProvider != nil) || (combinedRecognizerProvider != nil) }
    
    /// Front recognizer provider, used to scan front side of the document,
    /// or if no back recognizer is provided this one will be used for scanning.
    var frontRecognizerProvider: MBRecognizerWrapper? { return nil }
    
    /// Back recognizer provider, used to scan back side of the document.
    var backRecognizerProvider: MBRecognizerWrapper? { return nil }
    
    /// Combined recognizer provider, used to scan both sides of the document.
    /// First the front side has to be scanned, then the back side
    var combinedRecognizerProvider: MBRecognizerWrapper? { return nil }
    
    /// Type of document provided by this class
    public var type: MBDocumentType { return MBDocumentType.unknown }
    
    /// Aspect ratio of the document
    var aspectRatio: DocumentAspectRatio { return DocumentAspectRatio.unknown }
    
    /// Result validator that will be used to validate the results if it has both front and back side recognizer providers, or a combined recognizer.
    /// - Note: This will work with every combined recognizer if they have fields that
    ///         contain matching values. If this class doesn't have combined recognizer
    ///         provider, but has both front and back recognizer providers, keys that
    ///         will be used to match the results must be provided through
    ///         MBResultValidator initializer in concrete MBDocumentProvider classes.
    var resultValidator: MBValidatorProtocol { return MBCombinedValidator() }
    
    init(isFullySupported: Bool = true) {
        self.isFullySupported = isFullySupported
    }
}

// MARK: Generic documents
/// Here are defined concrete classes for generic documents
class MBIDDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }

    override var combinedRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withCombinedRecognizer: MBMrtdCombinedRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBIDWithDetectorD1DocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withDocumentDetector: MBDocumentDetectorD1Recognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBIDWithMrtdDetectorD1DocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }

    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withDocumentDetector: MBDocumentDetectorD1Recognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }

}

class MBDLDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
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

class MBResidencePermitDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.residencePermit
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}

class MBPassportDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBPassportRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.passport
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id3
    }

}

class MBVisaDocumentProvider: MBDocumentProvider {

    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }

    override var type: MBDocumentType {
        return MBDocumentType.visa
    }

    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id2
    }

}

class MBWorkPassDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }
    
    override var combinedRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withCombinedRecognizer: MBMrtdCombinedRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.identityCard
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
}

class MBVoterIDDocumentProvider: MBDocumentProvider {
    
    override var frontRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBDocumentFaceRecognizer())
    }
    
    override var backRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withRecognizer: MBMrtdRecognizer())
    }
    
    override var combinedRecognizerProvider: MBRecognizerWrapper? {
        return MBRecognizerWrapper(withCombinedRecognizer: MBMrtdCombinedRecognizer())
    }
    
    override var type: MBDocumentType {
        return MBDocumentType.voterID
    }
    
    override var aspectRatio: DocumentAspectRatio {
        return DocumentAspectRatio.id1
    }
    
}
