//
//  IdExtractors.swift
//  Showcase
//
//  Created by Dominik Cubelic on 22/08/2018.
//  Copyright © 2018 Dominik Cubelic. All rights reserved.
//

import Foundation
import MicroBlink

extension MBAustriaCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.principalResidence, value: result.principalResidence))
        fields.add(MBField(key: MBFieldKey.height, value: result.height))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssuance))
        fields.add(MBField(key: MBFieldKey.eyeColour, value: result.eyeColour))

        return fields
    }
}

extension MBAustriaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.principalResidence, value: result.principalResidence))
        fields.add(MBField(key: MBFieldKey.height, value: result.height))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssuance))
        fields.add(MBField(key: MBFieldKey.eyeColour, value: result.eyeColour))

        return fields
    }
}

extension MBAustriaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}

extension MBColombiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.bloodGroup, value: result.bloodGroup))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}

extension MBColombiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))

        return fields
    }
}

extension MBCroatiaCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.citizenship, value: result.citizenship))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalIdentificationNumber))

        return fields
    }
}

extension MBCroatiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.residenceFullAddress, value: result.residence))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.expiryDatePermanent, value: result.dateOfExpiryPermanent))

        return fields
    }
}

extension MBCroatiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.citizenship, value: result.citizenship))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.expiryDatePermanent, value: result.dateOfExpiryPermanent))

        return fields
    }
}

extension MBCyprusIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}

extension MBCyprusIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.idNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.name))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))

        return fields
    }
}

extension MBCzechiaCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalIdentificationNumber))

        return fields
    }
}

extension MBCzechiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.authority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.residenceFullAddress, value: result.permanentStay))
        fields.add(MBField(key: MBFieldKey.personalNumber, value: result.personalNumber))

        return fields
    }
}

extension MBCzechiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

        return fields
    }
}

extension MBEgyptIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.nationalNumber, value: result.nationalNumber))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))

        return fields
    }
}

extension MBGermanyCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.height, value: result.height))
        fields.add(MBField(key: MBFieldKey.eyeColour, value: result.eyeColor))
        fields.add(MBField(key: MBFieldKey.canNumber, value: result.canNumber))

        return fields
    }
}

extension MBGermanyIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.authority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.addressCity, value: result.addressCity))
        fields.add(MBField(key: MBFieldKey.addressStreet, value: result.addressStreet))
        fields.add(MBField(key: MBFieldKey.addressHouseNumber, value: result.addressHouseNumber))
        fields.add(MBField(key: MBFieldKey.addressZipCode, value: result.addressZipCode))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.height, value: result.height))
        fields.add(MBField(key: MBFieldKey.eyeColour, value: result.eyeColour))

        return fields
    }
}

extension MBGermanyIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.canNumber, value: result.canNumber))

        return fields
    }
}

extension MBGermanyOldIdRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

        return fields
    }
}

extension MBHongKongIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.commercialCode, value: result.commercialCode))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.residentialStatus, value: result.residentialStatus))

        return fields
    }
}

extension MBIkadRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.passportNumber, value: result.passportNumber))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.sector, value: result.sector))
        fields.add(MBField(key: MBFieldKey.employer, value: result.employer))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.facultyAddress, value: result.facultyAddress))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.expiryDate))

        return fields
    }
}

extension MBIndonesiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.province, value: result.province))
        fields.add(MBField(key: MBFieldKey.city, value: result.city))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.bloodType, value: result.bloodType))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.rt, value: result.rt))
        fields.add(MBField(key: MBFieldKey.rw, value: result.rw))
        fields.add(MBField(key: MBFieldKey.kelDesa, value: result.kelDesa))
        fields.add(MBField(key: MBFieldKey.district, value: result.district))
        fields.add(MBField(key: MBFieldKey.religion, value: result.religion))
        fields.add(MBField(key: MBFieldKey.maritalStatus, value: result.maritalStatus))
        fields.add(MBField(key: MBFieldKey.occupation, value: result.occupation))
        fields.add(MBField(key: MBFieldKey.citizenship, value: result.citizenship))

        return fields
    }
}

extension MBJordanCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.nationalNumber, value: result.nationalNumber))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuer))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

        return fields
    }
}

extension MBJordanIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.extractFieldResults())

        return fields
    }
}

extension MBJordanIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.nationalNumber, value: result.nationalNumber))
        fields.add(MBField(key: MBFieldKey.nationalNumber, value: result.nationalNumber))

        return fields
    }
}

extension MBKuwaitIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.serialNo, value: result.serialNo))

        return fields
    }
}

extension MBKuwaitIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.expiryDate))
        fields.add(MBField(key: MBFieldKey.civilIdNumber, value: result.civilIdNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))

        return fields
    }
}

extension MBMoroccoIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.name))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))

        return fields
    }
}

extension MBMoroccoIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.fathersName, value: result.fathersName))
        fields.add(MBField(key: MBFieldKey.mothersName, value: result.mothersName))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.civilStatusNumber, value: result.civilStatusNumber))

        return fields
    }
}

extension MBMrtdCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuer))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.documentCode, value: result.documentCode))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.primaryId, value: result.primaryId))
        fields.add(MBField(key: MBFieldKey.secondaryId, value: result.secondaryId))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.optional1, value: result.opt1))
        fields.add(MBField(key: MBFieldKey.optional2, value: result.opt2))
        fields.add(MBField(key: MBFieldKey.alienNumber, value: result.alienNumber))
        fields.add(MBField(key: MBFieldKey.applicationReceiptNumber, value: result.applicationReceiptNumber))
        fields.add(MBField(key: MBFieldKey.immigrantCaseNumber, value: result.immigrantCaseNumber))
        fields.add(MBField(key: MBFieldKey.mrzText, value: result.mrzText))

        return fields
    }
}

extension MBMexicoVoterIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.curp, value: result.curp))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.electorKey, value: result.electorKey))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
        return fields
    }
}

extension MBMyKadFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nricNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.ownerAddress))
        fields.add(MBField(key: MBFieldKey.addressCity, value: result.ownerAddressCity))
        fields.add(MBField(key: MBFieldKey.addressState, value: result.ownerAddressState))
        fields.add(MBField(key: MBFieldKey.addressZipCode, value: result.ownerAddressZipCode))
        fields.add(MBField(key: MBFieldKey.addressStreet, value: result.ownerAddressStreet))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.ownerBirthDate))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.ownerFullName))
        fields.add(MBField(key: MBFieldKey.religion, value: result.ownerReligion))
        fields.add(MBField(key: MBFieldKey.sex, value: result.ownerSex))
        fields.add(MBField(key: MBFieldKey.armyNumber, value: result.armyNumber))

        return fields
    }
}

extension MBMyKadBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.extendedNricNumber, value: result.extendedNric))
        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nric))
        fields.add(MBField(key: MBFieldKey.oldNric, value: result.oldNric))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))

        return fields
    }
}

extension MBMalaysiaMyTenteraFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nric))
        fields.add(MBField(key: MBFieldKey.armyNumber, value: result.armyNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.fullAddress))
        fields.add(MBField(key: MBFieldKey.city, value: result.city))
        fields.add(MBField(key: MBFieldKey.addressState, value: result.ownerState))
        fields.add(MBField(key: MBFieldKey.addressZipCode, value: result.zipcode))
        fields.add(MBField(key: MBFieldKey.addressStreet, value: result.street))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.religion, value: result.religion))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}

extension MBPolandCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.familyName, value: result.familyName))
        fields.add(MBField(key: MBFieldKey.parentsGivenName, value: result.parentsGivenNames))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuer))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

        return fields
    }
}

extension MBPolandIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.extractFieldResults()
    }
}

extension MBPolandIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.familyName, value: result.familyName))
        fields.add(MBField(key: MBFieldKey.parentsGivenName, value: result.parentsGivenNames))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))

        return fields
    }
}

extension MBRomaniaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.cardNumber))
        fields.add(MBField(key: MBFieldKey.idSeries, value: result.idSeries))
        fields.add(MBField(key: MBFieldKey.cnp, value: result.cnp))
        fields.add(MBField(key: MBFieldKey.parentNames, value: result.parentNames))
        fields.add(MBField(key: MBFieldKey.nonMrzNationality, value: result.nonMRZNationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.nonMrzSex, value: result.nonMRZSex))
        fields.add(MBField(key: MBFieldKey.validFrom, value: result.validFrom))
        fields.add(MBField(key: MBFieldKey.validUntil, value: result.validUntil))

        return fields
    }
}

extension MBSerbiaCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.jmbg, value: result.jmbg))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuer))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}
extension MBSerbiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.extractFieldResults()
    }
}

extension MBSerbiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.issuingDate))
        fields.add(MBField(key: MBFieldKey.validUntil, value: result.validUntil))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))

        return fields
    }
}

extension MBSingaporeCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.name))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.bloodGroup, value: result.bloodGroup))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.countryOfBirth, value: result.countryOfBirth))
        fields.add(MBField(key: MBFieldKey.race, value: result.race))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSingaporeIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.addressChangeDate, value: result.addressChangeDate))
        fields.add(MBField(key: MBFieldKey.bloodGroup, value: result.bloodGroup))
        fields.add(MBField(key: MBFieldKey.cardNumber, value: result.cardNumber))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSingaporeIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.name))
        fields.add(MBField(key: MBFieldKey.race, value: result.race))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.countryOfBirth, value: result.countryOfBirth))

        return fields
    }
}

extension MBSlovakiaCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalIdentificationNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.surnameAtBirth, value: result.surnameAtBirth))
        fields.add(MBField(key: MBFieldKey.specialRemarks, value: result.specialRemarks))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

        return fields
    }
}

extension MBSlovakiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.surnameAtBirth, value: result.surnameAtBirth))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.specialRemarks, value: result.specialRemarks))

        return fields
    }
}

extension MBSlovakiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.personalNumber, value: result.personalNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSloveniaCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.identityCardNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.citizenship, value: result.citizenship))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalIdentificationNumber))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuingAuthority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSloveniaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.authority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSloveniaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.lastName))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

        return fields
    }
}

extension MBSwitzerlandIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.givenName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))

        return fields
    }
}

extension MBSwitzerlandIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.placeOfOrigin, value: result.placeOfOrigin))
        fields.add(MBField(key: MBFieldKey.height, value: result.height))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuer))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.nonMrzDateOfExpiry, value: result.nonMrzDateOfExpiry))
        fields.add(MBField(key: MBFieldKey.nonMrzSex, value: result.nonMrzSex))

        return fields
    }
}

extension MBUnitedArabEmiratesIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.idNumber))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))

        return fields
    }
}

extension MBUnitedArabEmiratesIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.mrzResult.extractFieldResults()
    }
}