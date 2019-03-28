//
//  DlExtractors.swift
//  Showcase
//
//  Created by Dominik Cubelic on 23/08/2018.
//  Copyright © 2018 Dominik Cubelic. All rights reserved.
//

import Foundation
import MicroBlink

extension MBAustraliaDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.licenseType, value: result.licenceType))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.licenceExpiry))

        return fields
    }
}

extension MBAustraliaDlBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.licenceExpiry))

        return fields
    }
}

extension MBAustriaDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.vehicleCategories, value: result.vehicleCategories))

        return fields
    }
}

extension MBColombiaDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.driverRestrictions, value: result.driverRestrictions))
        fields.add(MBField(key: MBFieldKey.issuingAgency, value: result.issuingAgency))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))

        return fields
    }
}

extension MBEudlRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.birthData, value: result.birthData))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.issueDate))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.expiryDate))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))
        fields.add(MBField(key: MBFieldKey.driverNumber, value: result.driverNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))

        return fields
    }
}

extension MBGermanyDlBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfIssueB10, value: result.dateOfIssueB10))
        
        return fields
    }
}

extension MBGermanyDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.authority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.licenseCategories, value: result.licenceCategories))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

        return fields
    }
}

extension MBItalyDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.licenseCategories, value: result.licenceCategories))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))

        return fields
    }
}

extension MBIrelandDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.licenseCategories, value: result.licenceCategories))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))

        return fields
    }
}

extension MBMalaysiaDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityNumber))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dlClass, value: result.dlClass))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.validFrom))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.validUntil))
        fields.add(MBField(key: MBFieldKey.addressStreet, value: result.street))
        fields.add(MBField(key: MBFieldKey.city, value: result.city))
        fields.add(MBField(key: MBFieldKey.fullAddress, value: result.fullAddress))

        return fields
    }
}

extension MBNewZealandDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenseNumber))

        return fields
    }
}

extension MBSingaporeDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.issueDate))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.validTill))

        return fields
    }
}

extension MBSpainDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.number))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.licenseCategories, value: result.licenceCategories))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.validFrom))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.validUntil))

        return fields
    }
}

extension MBSwedenDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.name))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAgency))
        fields.add(MBField(key: MBFieldKey.licenseCategories, value: result.licenceCategories))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenceNumber))

        return fields
    }
}

extension MBSwitzerlandDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.expiryDatePermanent, value: result.expiryDatePermanent))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenseNumber))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.vehicleCategories, value: result.vehicleCategories))

        return fields
    }
}

extension MBUnitedArabEmiratesDlFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.expiryDate))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.issueDate))
        fields.add(MBField(key: MBFieldKey.licenseNumber, value: result.licenseNumber))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.licensingAuthority))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfIssue, value: result.placeOfIssue))

        return fields
    }
}

extension MBUsdlRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.driverRestrictions, value: result.restrictions))
        fields.add(MBField(key: MBFieldKey.endorsements, value: result.endorsements))
        fields.add(MBField(key: MBFieldKey.vehicleClass, value: result.vehicleClass))
        if let data = result.data() {
            let dataString = String(data: data, encoding: String.Encoding.utf8)
            fields.add(MBField(key: MBFieldKey.rawData, value: dataString))
        }

        return fields
    }
}

extension MBUsdlCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.driverRestrictions, value: result.restrictions))
        fields.add(MBField(key: MBFieldKey.endorsements, value: result.endorsements))
        fields.add(MBField(key: MBFieldKey.vehicleClass, value: result.vehicleClass))
        if let data = result.data() {
            let dataString = String(data: data, encoding: String.Encoding.utf8)
            fields.add(MBField(key: MBFieldKey.rawData, value: dataString))
        }

        return fields
    }
}
