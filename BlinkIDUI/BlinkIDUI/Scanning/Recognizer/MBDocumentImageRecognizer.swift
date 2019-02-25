//
//  MBDocumentImageRecognizer.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 23/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

class MBDocumentImageRecognizer: NSObject, MBTemplatingClassifier {
    func classify() -> Bool {
        return true
    }

    private var _fullDocumentImageProcessor: MBImageReturnProcessor
    private var _classDocumentImageProcessor: MBImageReturnProcessor
    var detectorRecognizer: MBDetectorRecognizer

    init(specification: MBDocumentSpecificationPreset) {
        let specification: MBDocumentSpecification = MBDocumentSpecification.create(from: specification)
        let detector = MBDocumentDetector(documentSpecifications: [specification])
        detectorRecognizer = MBDetectorRecognizer(quadWithSizeDetector: detector)
        
        detector.numStableDetectionsThreshold = 12

        _fullDocumentImageProcessor = MBImageReturnProcessor()
        _classDocumentImageProcessor = MBImageReturnProcessor()
        
        let fullDocumentProcessorGroup = MBProcessorGroup(processingLocation: CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0), dewarpPolicy: MBDPIBasedDewarpPolicy(desiredDPI: 200), andProcessors: [_fullDocumentImageProcessor])
        let classGrp = MBProcessorGroup(processingLocation: CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0), dewarpPolicy: MBDPIBasedDewarpPolicy(desiredDPI: 200), andProcessors: [_classDocumentImageProcessor])

        super.init()
        
        let fullImageClass = MBTemplatingClass()
        fullImageClass.setClassificationProcessorGroups([classGrp])
        fullImageClass.setNonClassificationProcessorGroups([fullDocumentProcessorGroup])
        fullImageClass.setTemplatingClassifier(self)

        detectorRecognizer.setTemplatingClasses([fullImageClass])
    }

    func fullDocumentImage() -> MBImage? {
        return _fullDocumentImageProcessor.result.rawImage
    }
}

class MBDocumentDetectorRecognizer: NSObject {
    var documentImageRecognizer: MBDocumentImageRecognizer?

    func recognizer() -> MBRecognizer? {
        return documentImageRecognizer?.detectorRecognizer
    }

    func fullDocumentImage() -> MBImage? {
        return documentImageRecognizer?.fullDocumentImage()
    }
}

class MBDocumentDetectorD1Recognizer: MBDocumentDetectorRecognizer {
    override init() {
        super.init()
        documentImageRecognizer = MBDocumentImageRecognizer(specification: .id1Card)
    }
}

class MBDocumentDetectorD2Recognizer: MBDocumentDetectorRecognizer {
    override init() {
        super.init()
        documentImageRecognizer = MBDocumentImageRecognizer(specification: .id2Card)
    }
}

class MBDocumentDetectorD2VerticalRecognizer: MBDocumentDetectorRecognizer {
    override init() {
        super.init()
        documentImageRecognizer = MBDocumentImageRecognizer(specification: .id2VerticalCard)
    }
}

extension MBDetectorRecognizer {
    class var full_DOCUMENT_IMAGED1: String {
        return "IDCard"
    }

    class var full_DOCUMENT_IMAGED2: String {
        return "ID2Card"
    }

    class var full_DOCUMENT_IMAGE_VERTICAL_D2: String {
        return "ID2CardVertical"
    }
}
