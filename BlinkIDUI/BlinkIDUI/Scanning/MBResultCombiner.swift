//
//  MBResultCombiner.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 2/1/19.
//  Copyright © 2019 Microblink. All rights reserved.
//

import Foundation

class MBResultCombiner {
    
    static let keyPriority: [MBFieldKey] = [
        // FIRST NAMES
            .secondaryId,
            .firstName,
            .givenName,
        // LAST NAMES
            .primaryId,
            .lastName,
        // SEX
            .sex,
            .nonMrzSex,
        // BIRTH DATE
            .dateOfBirth,
            .nonMrzDateOfBirth,
        // NATIONALIRY
            .nationality,
            .nonMrzNationality,
        // EXPIRY DATE
            .dateOfExpiry,
            .nonMrzDateOfExpiry,
        // DOCUMENT NUMBER
            .documentNumber,
        // NRIC
            .nricNumber
    ]

    static func combineFields(fields: [MBField]) -> [MBField] {
        let filteredFields = fields.filter { return !MBResultCombiner.checkKey(key: $0.key )}
        
        // Early exit if there are no fields to be combined
        guard filteredFields.count != fields.count else { return fields }
        
        let combinigFields = fields.filter { return MBResultCombiner.checkKey(key: $0.key )}.sorted(by: { return MBResultCombiner._compareFields(field1: $0, field2: $1) })
        
        var mutableFields = [MBField]()
        for value in combinigFields {
            if !mutableFields.contains(where: { return MBResultCombiner.equalKeys(key1: $0.key, key2: value.key) }) {
                mutableFields.append(value)
            }
        }
        
        mutableFields.append(contentsOf: filteredFields)
        
        return mutableFields
    }
    
    private static func _compareFields(field1: MBField, field2: MBField) -> Bool {
        guard let firstIndex = MBResultCombiner.keyPriority.firstIndex(of: field1.key),
            let secondIndex = MBResultCombiner.keyPriority.firstIndex(of: field2.key) else { return false }
        
        return firstIndex < secondIndex
    }
    
    private static func equalKeys(key1: MBFieldKey, key2: MBFieldKey) -> Bool {
        return (_checkIfFirstName(key: key1) && _checkIfFirstName(key: key2))
        || (_checkIfLastName(key: key1) && _checkIfLastName(key: key2))
        || (_checkIfSex(key: key1) && _checkIfSex(key: key2))
        || (_checkIfDateOfBirth(key: key1) && _checkIfDateOfBirth(key: key2))
        || (_checkIfNationality(key: key1) && _checkIfNationality(key: key2))
        || (_checkIfDateOfExpiry(key: key1) && _checkIfDateOfExpiry(key: key2))
        || (_checkIfNric(key: key1) && _checkIfNric(key: key2))
        || (_checkIfDocumentNumber(key: key1) && _checkIfDocumentNumber(key: key2))
    }
    
    private static func checkKey(key: MBFieldKey) -> Bool {
        return _checkIfFirstName(key: key)
            || _checkIfLastName(key: key)
            || _checkIfSex(key: key)
            || _checkIfDateOfBirth(key: key)
            || _checkIfNationality(key: key)
            || _checkIfDateOfExpiry(key: key)
            || _checkIfNric(key: key)
            || _checkIfDocumentNumber(key: key)
    }
    
    private static func _checkIfFirstName(key: MBFieldKey) -> Bool {
        return key == .firstName || key == .secondaryId || key == .givenName
    }
    
    private static func _checkIfLastName(key: MBFieldKey) -> Bool {
        return key == .lastName || key == .primaryId
    }
    
    private static func _checkIfSex(key: MBFieldKey) -> Bool {
        return key == .sex || key == .nonMrzSex
    }
    
    private static func _checkIfDateOfBirth(key: MBFieldKey) -> Bool {
        return key == .nonMrzDateOfBirth || key == .dateOfBirth
    }
    
    private static func _checkIfNationality(key: MBFieldKey) -> Bool {
        return key == .nonMrzNationality || key == .nationality
    }
    
    private static func _checkIfDateOfExpiry(key: MBFieldKey) -> Bool {
        return key == .nonMrzDateOfExpiry || key == .dateOfExpiry
    }
    
    private static func _checkIfNric(key: MBFieldKey) -> Bool {
        return key == .nricNumber
    }
    
    private static func _checkIfDocumentNumber(key: MBFieldKey) -> Bool {
        return key == .documentNumber
    }
}
