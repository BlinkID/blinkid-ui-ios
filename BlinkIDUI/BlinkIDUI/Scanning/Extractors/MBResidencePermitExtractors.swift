//
//  MBResidencePermitExtractors.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 24/01/2019.
//  Copyright © 2019 Microblink. All rights reserved.
//

import MicroBlink

extension MBBruneiResidencePermitBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())
        
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.race, value: result.race))
        
        return fields
    }
}

extension MBBruneiResidencePermitFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
        return fields
    }
}

extension MBBruneiTemporaryResidencePermitBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())
        
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.passportNumber, value: result.passportNumber))
        
        return fields
    }
}

extension MBBruneiTemporaryResidencePermitFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        
        return fields
    }
}
