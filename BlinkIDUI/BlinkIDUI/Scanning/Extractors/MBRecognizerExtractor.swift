//
//  MBRecognizerExtractor.swift
//  Showcase
//
//  Created by Dominik Cubelic on 30/07/2018.
//  Copyright © 2018 Dominik Cubelic. All rights reserved.
//

import Foundation
import MicroBlink

protocol MBFieldResult {
    func extractFieldResults() -> NSArray
    var resultTitle: String { get }
}

extension MBFieldResult {
    var resultTitle: String {
        guard let results = extractFieldResults() as? [MBField] else { return "" }
        if let firstName = results.first(where: { $0.key == .fullName })?.value as? MBStringValue {
            return firstName.value
        }
        let firstName = results.first(where: { $0.key == .firstName })?.value as? MBStringValue
        let lastName = results.first(where: { $0.key == .lastName })?.value as? MBStringValue
        return "\(firstName?.value ?? "") \(lastName?.value ?? "")"
    }
}

extension MBRecognizer: MBFieldResult {

    @objc func extractFieldResults() -> NSArray {
        print("\(self.self) doesn't override extractFieldResults method.")
        return NSArray()
    }

    func setupRecognizer() {
        if let self = self as? MBPdf417Recognizer {
            self.scanUncertain = true
        }

        if let self = self as? MBMrtdRecognizer {
            self.allowUnverifiedResults = true
        }

        if let self = self as? MBFullDocumentImage {
            self.returnFullDocumentImage = true
        }

        if let self = self as? MBSignatureImage {
            self.returnSignatureImage = true
        }

        if let self = self as? MBFaceImage {
            self.returnFaceImage = true
        }

    }

}

extension MBMrtdRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.mrzResult.extractFieldResults()
    }
}

extension MBMrzResult {
    private struct Constants {
        static let lessThen: String = "<"
    }
    
    func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.issuer, value: _stripMRZCharacter(value: issuer)))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: _stripMRZCharacter(value: documentNumber)))
        fields.add(MBField(key: MBFieldKey.documentCode, value: _stripMRZCharacter(value: documentCode)))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.primaryId, value: _stripMRZCharacter(value: primaryID)))
        fields.add(MBField(key: MBFieldKey.secondaryId, value: _stripMRZCharacter(value: secondaryID)))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: dateOfBirth))
        fields.add(MBField(key: MBFieldKey.nationality, value: _stripMRZCharacter(value: nationality)))
        fields.add(MBField(key: MBFieldKey.sex, value: _stripMRZCharacter(value: gender)))
        fields.add(MBField(key: MBFieldKey.optional1, value: _stripMRZCharacter(value: opt1)))
        fields.add(MBField(key: MBFieldKey.optional2, value: _stripMRZCharacter(value: opt2)))
        fields.add(MBField(key: MBFieldKey.alienNumber, value: _stripMRZCharacter(value: alienNumber)))
        fields.add(MBField(key: MBFieldKey.applicationReceiptNumber, value: _stripMRZCharacter(value: applicationReceiptNumber)))
        fields.add(MBField(key: MBFieldKey.immigrantCaseNumber, value: _stripMRZCharacter(value: immigrantCaseNumber)))
        fields.add(MBField(key: MBFieldKey.mrzText, value: mrzText))

        return fields
    }
    
    private func _stripMRZCharacter(value: String) -> String {
        return value.replacingOccurrences(of: Constants.lessThen, with: "")
    }
}

extension MBVisaRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.mrzResult.extractFieldResults()
    }
}
