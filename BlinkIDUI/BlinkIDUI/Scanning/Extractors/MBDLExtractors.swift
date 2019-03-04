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
        return result.getAllUsdlValues()
    }
}

extension MBUsdlCombinedRecognizer {
    override func extractFieldResults() -> NSArray {
        return result.getAllUsdlValues()
    }
}

extension MBRecognizerResult {
    private func getField(for usdlKey: MBUsdlKeys) -> String? {
        if let recognizer = self as? MBUsdlRecognizerResult {
            return recognizer.getField(usdlKey)
        } else if let recognizer = self as? MBUsdlCombinedRecognizerResult {
            return recognizer.getField(usdlKey)
        }

        return nil
    }

    func getAllUsdlValues() -> NSArray {
        let fields = NSMutableArray()

        fields.add(MBField(key: MBFieldKey.documentType, value: getField(for: MBUsdlKeys.DocumentType)))
        fields.add(MBField(key: MBFieldKey.standardVersionNumber, value: getField(for: MBUsdlKeys.StandardVersionNumber)))
        fields.add(MBField(key: MBFieldKey.firstName, value: getField(for: MBUsdlKeys.CustomerFirstName)))
        fields.add(MBField(key: MBFieldKey.familyName, value: getField(for: MBUsdlKeys.CustomerFamilyName)))
        fields.add(MBField(key: MBFieldKey.fullName, value: getField(for: MBUsdlKeys.CustomerFullName)))
        fields.add(MBField(key: MBFieldKey.dateOfBirth, value: getField(for: MBUsdlKeys.DateOfBirth)))
        fields.add(MBField(key: MBFieldKey.sex, value: getField(for: MBUsdlKeys.Sex)))
        fields.add(MBField(key: MBFieldKey.eyeColour, value: getField(for: MBUsdlKeys.EyeColor)))
        fields.add(MBField(key: MBFieldKey.addressCity, value: getField(for: MBUsdlKeys.AddressCity)))
        fields.add(MBField(key: MBFieldKey.addressJurisdictionCode, value: getField(for: MBUsdlKeys.AddressJurisdictionCode)))
        fields.add(MBField(key: MBFieldKey.address, value: getField(for: MBUsdlKeys.ResidenceFullAddress)))
        fields.add(MBField(key: MBFieldKey.heightIn, value: getField(for: MBUsdlKeys.HeightIn)))
        fields.add(MBField(key: MBFieldKey.heightCm, value: getField(for: MBUsdlKeys.HeightCm)))
        fields.add(MBField(key: MBFieldKey.middleName, value: getField(for: MBUsdlKeys.CustomerMiddleName)))
        fields.add(MBField(key: MBFieldKey.hairColor, value: getField(for: MBUsdlKeys.HairColor)))
        fields.add(MBField(key: MBFieldKey.nameSuffix, value: getField(for: MBUsdlKeys.NameSuffix)))
        fields.add(MBField(key: MBFieldKey.akaFullName, value: getField(for: MBUsdlKeys.AKAFullName)))
        fields.add(MBField(key: MBFieldKey.akaFamilyName, value: getField(for: MBUsdlKeys.AKAFamilyName)))
        fields.add(MBField(key: MBFieldKey.akaGivenName, value: getField(for: MBUsdlKeys.AKAGivenName)))
        fields.add(MBField(key: MBFieldKey.akaSuffixName, value: getField(for: MBUsdlKeys.AKASuffixName)))
        fields.add(MBField(key: MBFieldKey.weightRange, value: getField(for: MBUsdlKeys.WeightRange)))
        fields.add(MBField(key: MBFieldKey.weightPounds, value: getField(for: MBUsdlKeys.WeightPounds)))
        fields.add(MBField(key: MBFieldKey.weightKilograms, value: getField(for: MBUsdlKeys.WeightKilograms)))
        fields.add(MBField(key: MBFieldKey.identityCardNumber, value: getField(for: MBUsdlKeys.CustomerIdNumber)))
        fields.add(MBField(key: MBFieldKey.familyNameTruncation, value: getField(for: MBUsdlKeys.FamilyNameTruncation)))
        fields.add(MBField(key: MBFieldKey.firstNameTruncation, value: getField(for: MBUsdlKeys.FirstNameTruncation)))
        fields.add(MBField(key: MBFieldKey.middleNameTruncation, value: getField(for: MBUsdlKeys.MiddleNameTruncation)))
        fields.add(MBField(key: MBFieldKey.placeOfBirth, value: getField(for: MBUsdlKeys.PlaceOfBirth)))
        fields.add(MBField(key: MBFieldKey.addressStreet2, value: getField(for: MBUsdlKeys.AddressStreet2)))
        fields.add(MBField(key: MBFieldKey.raceEthnicity, value: getField(for: MBUsdlKeys.RaceEthnicity)))
        fields.add(MBField(key: MBFieldKey.namePrefix, value: getField(for: MBUsdlKeys.NamePrefix)))
        fields.add(MBField(key: MBFieldKey.countryIdentification, value: getField(for: MBUsdlKeys.CountryIdentification)))
        fields.add(MBField(key: MBFieldKey.residenceStreetAddress, value: getField(for: MBUsdlKeys.ResidenceStreetAddress)))
        fields.add(MBField(key: MBFieldKey.residenceStreetAddress2, value: getField(for: MBUsdlKeys.ResidenceStreetAddress2)))
        fields.add(MBField(key: MBFieldKey.residenceCity, value: getField(for: MBUsdlKeys.ResidenceCity)))
        fields.add(MBField(key: MBFieldKey.residenceJurisdictionCode, value: getField(for: MBUsdlKeys.ResidenceJurisdictionCode)))
        fields.add(MBField(key: MBFieldKey.residencePostalCode, value: getField(for: MBUsdlKeys.ResidencePostalCode)))
        fields.add(MBField(key: MBFieldKey.residenceFullAddress, value: getField(for: MBUsdlKeys.ResidenceFullAddress)))
        fields.add(MBField(key: MBFieldKey.under18, value: getField(for: MBUsdlKeys.Under18)))
        fields.add(MBField(key: MBFieldKey.under19, value: getField(for: MBUsdlKeys.Under19)))
        fields.add(MBField(key: MBFieldKey.under21, value: getField(for: MBUsdlKeys.Under21)))
        fields.add(MBField(key: MBFieldKey.socialSecurityNumber, value: getField(for: MBUsdlKeys.SocialSecurityNumber)))
        fields.add(MBField(key: MBFieldKey.akaSocialSecurityNumber, value: getField(for: MBUsdlKeys.AKASocialSecurityNumber)))
        fields.add(MBField(key: MBFieldKey.akaMiddleName, value: getField(for: MBUsdlKeys.AKAMiddleName)))
        fields.add(MBField(key: MBFieldKey.akaPrefixName, value: getField(for: MBUsdlKeys.AKAPrefixName)))
        fields.add(MBField(key: MBFieldKey.organDonor, value: getField(for: MBUsdlKeys.OrganDonor)))
        fields.add(MBField(key: MBFieldKey.veteran, value: getField(for: MBUsdlKeys.Veteran)))
        fields.add(MBField(key: MBFieldKey.akaDateOfBirth, value: getField(for: MBUsdlKeys.AKADateOfBirth)))
        fields.add(MBField(key: MBFieldKey.issuerIdentificationNumber, value: getField(for: MBUsdlKeys.IssuerIdentificationNumber)))
        fields.add(MBField(key: MBFieldKey.dateOfExpiry, value: getField(for: MBUsdlKeys.DocumentExpirationDate)))
        fields.add(MBField(key: MBFieldKey.jurisdictionVersionNumber, value: getField(for: MBUsdlKeys.JurisdictionVersionNumber)))
        fields.add(MBField(key: MBFieldKey.jurisdictionVehicleClass, value: getField(for: MBUsdlKeys.JurisdictionVehicleClass)))
        fields.add(MBField(key: MBFieldKey.jurisdictionRestrictionCodes, value: getField(for: MBUsdlKeys.JurisdictionRestrictionCodes)))
        fields.add(MBField(key: MBFieldKey.jurisdictionEndorsementCodes, value: getField(for: MBUsdlKeys.JurisdictionEndorsementCodes)))
        fields.add(MBField(key: MBFieldKey.dateOfIssue, value: getField(for: MBUsdlKeys.DocumentIssueDate)))
        fields.add(MBField(key: MBFieldKey.federalCommercialVehicleCodes, value: getField(for: MBUsdlKeys.FederalCommercialVehicleCodes)))
        fields.add(MBField(key: MBFieldKey.issuingJurisdiction, value: getField(for: MBUsdlKeys.IssuingJurisdiction)))
        fields.add(MBField(key: MBFieldKey.standardVehicleClassification, value: getField(for: MBUsdlKeys.StandardVehicleClassification)))
        fields.add(MBField(key: MBFieldKey.issuingJurisdictionName, value: getField(for: MBUsdlKeys.IssuingJurisdictionName)))
        fields.add(MBField(key: MBFieldKey.standardEndorsementCode, value: getField(for: MBUsdlKeys.StandardEndorsementCode)))
        fields.add(MBField(key: MBFieldKey.standardRestrictionCode, value: getField(for: MBUsdlKeys.StandardRestrictionCode)))
        fields.add(MBField(key: MBFieldKey.jurisdictionVehicleClassificationDescription, value: getField(for: MBUsdlKeys.JurisdictionVehicleClassificationDescription)))
        fields.add(MBField(key: MBFieldKey.jurisdictionEndorsmentCodeDescription, value: getField(for: MBUsdlKeys.JurisdictionEndorsmentCodeDescription)))
        fields.add(MBField(key: MBFieldKey.jurisdictionRestrictionCodeDescription, value: getField(for: MBUsdlKeys.JurisdictionRestrictionCodeDescription)))
        fields.add(MBField(key: MBFieldKey.inventoryControlNumber, value: getField(for: MBUsdlKeys.InventoryControlNumber)))
        fields.add(MBField(key: MBFieldKey.cardRevisionDate, value: getField(for: MBUsdlKeys.CardRevisionDate)))
        fields.add(MBField(key: MBFieldKey.documentDiscriminator, value: getField(for: MBUsdlKeys.DocumentDiscriminator)))
        fields.add(MBField(key: MBFieldKey.limitedDurationDocument, value: getField(for: MBUsdlKeys.LimitedDurationDocument)))
        fields.add(MBField(key: MBFieldKey.auditInformation, value: getField(for: MBUsdlKeys.AuditInformation)))
        fields.add(MBField(key: MBFieldKey.complianceType, value: getField(for: MBUsdlKeys.ComplianceType)))
        fields.add(MBField(key: MBFieldKey.issueTimestamp, value: getField(for: MBUsdlKeys.IssueTimestamp)))
        fields.add(MBField(key: MBFieldKey.permitExpirationDate, value: getField(for: MBUsdlKeys.PermitExpirationDate)))
        fields.add(MBField(key: MBFieldKey.permitIdentifier, value: getField(for: MBUsdlKeys.PermitIdentifier)))
        fields.add(MBField(key: MBFieldKey.permitIssueDate, value: getField(for: MBUsdlKeys.PermitIssueDate)))
        fields.add(MBField(key: MBFieldKey.numberOfDuplicates, value: getField(for: MBUsdlKeys.NumberOfDuplicates)))
        fields.add(MBField(key: MBFieldKey.hazmatExpirationDate, value: getField(for: MBUsdlKeys.HAZMATExpirationDate)))
        fields.add(MBField(key: MBFieldKey.medicalIndicator, value: getField(for: MBUsdlKeys.MedicalIndicator)))
        fields.add(MBField(key: MBFieldKey.nonResident, value: getField(for: MBUsdlKeys.NonResident)))
        fields.add(MBField(key: MBFieldKey.uniqueCustomerId, value: getField(for: MBUsdlKeys.UniqueCustomerId)))
        fields.add(MBField(key: MBFieldKey.dataDiscriminator, value: getField(for: MBUsdlKeys.DataDiscriminator)))
        fields.add(MBField(key: MBFieldKey.documentExpirationMonth, value: getField(for: MBUsdlKeys.DocumentExpirationMonth)))
        fields.add(MBField(key: MBFieldKey.documentNonexpiring, value: getField(for: MBUsdlKeys.DocumentNonexpiring)))
        fields.add(MBField(key: MBFieldKey.securityVersion, value: getField(for: MBUsdlKeys.SecurityVersion)))

        return fields
    }
}
