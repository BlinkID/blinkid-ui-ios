//
//  PassportExtractors.swift
//  Showcase
//
//  Created by Dominik Cubelic on 23/08/2018.
//  Copyright © 2018 Dominik Cubelic. All rights reserved.
//

import Foundation
import MicroBlink

extension MBAustriaPassportRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.passportNumber, value: result.passportNumber))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

        return fields
    }
}

extension MBGermanyPassportRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.name))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.authority))

        return fields
    }
}

extension MBSwitzerlandPassportRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.placeOfOrigin, value: result.placeOfOrigin))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.nonMrzDateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.nonMrzDateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.passportNumber, value: result.passportNumber))
        fields.add(MBField(key: MBFieldKey.nonMrzSex, value: result.sex))

        return fields
    }
}
