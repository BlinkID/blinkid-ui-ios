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
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssuance))

        return fields
    }
}

extension MBAustriaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}

extension MBBruneiIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())
        
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.race, value: result.race))
        
        return fields
    }
}

extension MBBruneiIdFrontRecognizer {
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

extension MBBruneiMilitaryIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.armyNumber, value: result.armyNumber))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        
        return fields
    }
}

extension MBBruneiMilitaryIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.rank, value: result.rank))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        
        return fields
    }
}

extension MBColombiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
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
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.citizenship, value: result.citizenship))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.residence))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.oib))

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
        let fields = result.mrzResult.extractFieldResults()
        
        return fields
    }
}

extension MBCyprusIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.idNumber))

        return fields
    }
}

extension MBCyprusOldIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
        return fields
    }
}

extension MBCyprusOldIdFrontRecognizer {
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

        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.address, value: result.permanentStay))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))

        return fields
    }
}

extension MBCzechiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.authority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.residenceFullAddress, value: result.permanentStay))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))

        return fields
    }
}

extension MBCzechiaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
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

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.height, value: result.height))
        fields.add(MBField(key: MBFieldKey.eyeColour, value: result.colourOfEyes))
        fields.add(MBField(key: MBFieldKey.canNumber, value: result.canNumber))

        return fields
    }
}

extension MBGermanyIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.authority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.addressCity, value: result.addressCity))
        fields.add(MBField(key: MBFieldKey.addressStreet, value: result.addressStreet))
        fields.add(MBField(key: MBFieldKey.address, value: result.fullAddress))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBGermanyIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.canNumber, value: result.canNumber))

        return fields
    }
}

extension MBGermanyIdOldRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

        return fields
    }
}

extension MBHongKongIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.residentialStatus, value: result.residentialStatus))

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
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
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
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

        return fields
    }
}

extension MBJordanIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))

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

extension MBMalaysiaIkadFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.fullName, value: result.name))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.gender))
        fields.add(MBField(key: MBFieldKey.sector, value: result.sector))
        fields.add(MBField(key: MBFieldKey.employer, value: result.employer))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.facultyAddress, value: result.facultyAddress))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        
        return fields
    }
}

extension MBMalaysiaMyKadBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nric))
        fields.add(MBField(key: MBFieldKey.oldNric, value: result.oldNric))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        
        return fields
    }
}

extension MBMalaysiaMyKadFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nric))
        fields.add(MBField(key: MBFieldKey.fullAddress, value: result.fullAddress))
        fields.add(MBField(key: MBFieldKey.city, value: result.city))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.religion, value: result.religion))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
        return fields
    }
}

extension MBMalaysiaMyKasFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.city, value: result.city))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.fullAddress, value: result.fullAddress))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nric))
        fields.add(MBField(key: MBFieldKey.religion, value: result.religion))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))

        return fields
    }
}

extension MBMalaysiaMyPrFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.city, value: result.city))
        fields.add(MBField(key: MBFieldKey.country, value: result.countryCode))
        fields.add(MBField(key: MBFieldKey.fullAddress, value: result.fullAddress))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.nricNumber, value: result.nric))
        fields.add(MBField(key: MBFieldKey.religion, value: result.religion))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
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
        fields.add(MBField(key: MBFieldKey.addressStreet, value: result.street))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.birthDate))
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.religion, value: result.religion))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
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
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.civilStatusNumber, value: result.civilStatusNumber))

        return fields
    }
}

extension MBMrtdCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.mrzResult.extractFieldResults()
    }
}

extension MBMexicoVoterIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.fullName, value: result.fullName))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.curp, value: result.curp))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        
        return fields
    }
}

extension MBPdf417Recognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()
        
        fields.add(MBField(key: MBFieldKey.barcodeData, value: result.stringData))
        
        return fields
    }
}

extension MBPolandCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.familyName, value: result.familyName))
        fields.add(MBField(key: MBFieldKey.parentsGivenName, value: result.parentsGivenNames))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.nationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.documentNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

        return fields
    }
}

extension MBPolandIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.mrzResult.extractFieldResults()
    }
}

extension MBPolandIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))

        return fields
    }
}

extension MBRomaniaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.firstName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.mrzResult.documentNumber))
        fields.add(MBField(key: MBFieldKey.nonMrzNationality, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuer, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))

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
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.cardNumber))
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
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.issuedBy))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.surnameAtBirth, value: result.surnameAtBirth))
        fields.add(MBField(key: MBFieldKey.specialRemarks, value: result.specialRemarks))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

        return fields
    }
}

extension MBSlovakiaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: result.placeOfBirth))

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
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.personalNumber))
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

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: result.documentNumber))
        fields.add(MBField(key: MBFieldKey.sex, value: result.sex))
        fields.add(MBField(key: MBFieldKey.citizenship, value: result.nationality))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.personalIdentificationNumber, value: result.pin))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.administrativeUnit))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSloveniaIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.address, value: result.address))
        fields.add(MBField(key: MBFieldKey.authority, value: result.administrativeUnit))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))

        return fields
    }
}

extension MBSloveniaIdFrontRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenNames))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
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

        fields.add(MBField(key: MBFieldKey.firstName, value: result.givenName))
        fields.add(MBField(key: MBFieldKey.lastName, value: result.surname))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: result.dateOfBirth))

        return fields
    }
}

extension MBSwitzerlandIdBackRecognizer {
    override func extractFieldResults() -> NSArray {
        let fields = NSMutableArray(array: result.mrzResult.extractFieldResults())

        fields.add(MBField(key: MBFieldKey.placeOfOrigin, value: result.placeOfOrigin))
        fields.add(MBField(key: MBFieldKey.issuingAuthority, value: result.authority))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: result.dateOfIssue))
        fields.add(MBField(key: MBFieldKey.nonMrzDateOfExpiry, value: result.dateOfExpiry))
        fields.add(MBField(key: MBFieldKey.nonMrzSex, value: result.sex))

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
