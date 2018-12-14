//
//  MBRecognitionResult.swift
//  MicroBlinkUI
//
//  Created by Jure Čular on 09/10/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import UIKit

/// Class representing the results of document scanning
@objc public class MBRecognitionResult: NSObject {
    
    /// General description of the result.
    /// - Default: String made of firstName and lastName fields, can be "" if first or last name don't exist in the results.
    @objc public let resultTitle: String
    
    /// All the fields scanned during the scanning process of one document.
    /// Contains both front and back side results if both side scanning is enabled.
    @objc public let resultEntries: [MBField]
    
    /// Image of the front side of the document.
    /// - If the document recognizer supports document image retrieval it will be returned.
    @objc public let frontSideDocumentImage: UIImage?
    
    /// Image of the back side of the document.
    /// - If the document recognizer supports document image retrieval it will be returned.
    @objc public let backSideDocumentImage: UIImage?
    
    /// Face image of the document.
    /// - If the document recognizer supports face image retrieval it will be returned.
    @objc public let faceImage: UIImage?
    
    /// Signature image of the document.
    /// - If the document recognizer supports signature image retrieval it will be returned.
    @objc public let signatureImage: UIImage?

    @objc init(resultTitle: String, resultEntries: [MBField], frontSideDocumentImage: UIImage?, backSideDocumentImage: UIImage?, faceImage: UIImage?, signatureImage: UIImage?) {
        self.resultTitle = resultTitle
        self.resultEntries = resultEntries
        self.frontSideDocumentImage = frontSideDocumentImage
        self.backSideDocumentImage = backSideDocumentImage
        self.faceImage = faceImage
        self.signatureImage = signatureImage
    }

    public override var description: String {
        return "ResultTitle:\(resultTitle)\nResultEntries:\(resultEntries)"
    }
}
