//
//  MBField.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 02/10/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

/// `MBFieldKey` enum represents one field or one result of scanning.
/// Here are defined all the "properties" that can be extracted from all our recognizers used in
/// BlinkIDUI. For a specific country you can see the results by checking out the '*Extractor.swift' files.
/// In them are defined extractors that extract the result into an array of `MBField`s
@objc public enum MBFieldKey: Int, MBLocalizable, Comparable {
    case address
    case addressChangeDate
    case addressCity
    case addressHouseNumber
    case addressJurisdictionCode
    case addressState
    case addressStreet
    case addressStreet2
    case addressZipCode
    case akaDateOfBirth
    case akaFullName
    case akaGivenName
    case akaMiddleName
    case akaPrefixName
    case akaSocialSecurityNumber
    case akaSuffixName
    case alienNumber
    case applicationReceiptNumber
    case armyId
    case armyNumber
    case auditInformation
    case authority
    case birthData
    case bloodGroup
    case bloodType
    case canNumber
    case cardNumber
    case cardRevisionDate
    case cardVersion
    case citizenship
    case city
    case civilIdNumber
    case civilStatusNumber
    case cnp
    case commercialCode
    case companyName
    case complianceType
    case country
    case countryIdentification
    case countryOfBirth
    case curp
    case dataDiscriminator
    case dateOfBirth
    case dateOfExpiry
    case dateOfIssue
    case dateOfIssueB10
    case dateOfIssueB10NotSpecified
    case district
    case dlClass
    case documentCode
    case documentDataMatch
    case documentDiscriminator
    case documentExpirationDate
    case documentExpirationMonth
    case documentNonexpiring
    case documentNumber
    case documentType
    case donorIndicator
    case driverNumber
    case driverRestrictions
    case electorKey
    case employer
    case employerAddress
    case expiryDatePermanent
    case extendedNricNumber
    case eyeColour
    case facultyAddress
    case familyName
    case familyNameTruncation
    case fathersName
    case federalCommercialVehicleCodes
    case fingerprint
    case firstName
    case firstNameTruncation
    case fullAddress
    case fullName
    case givenName
    case hairColor
    case hazmatExpirationDate
    case height
    case heightCm
    case heightIn
    case houseNumber
    case idSeries
    case identityCardNumber
    case immigrantCaseNumber
    case inventoryControlNumber
    case isUncertain
    case issueTimestamp
    case issuer
    case issuerIdentificationNumber
    case issuingAgency
    case issuingAuthority
    case issuingJurisdiction
    case issuingJurisdictionName
    case jmbg
    case jurisdictionEndorsementCodes
    case jurisdictionEndorsmentCodeDescription
    case jurisdictionRestrictionCodeDescription
    case jurisdictionRestrictionCodes
    case jurisdictionVehicleClass
    case jurisdictionVehicleClassificationDescription
    case jurisdictionVersionNumber
    case kelDesa
    case lastName
    case licenseCategories
    case licenseClass
    case licenseNumber
    case licenseType
    case limitedDurationDocument
    case maritalStatus
    case marriageStatus
    case medicalIndicator
    case middleName
    case middleNameTruncation
    case mothersName
    case mrtdVerified
    case mrzParsed
    case mrzText
    case namePrefix
    case nameSuffix
    case nationalNumber
    case nationality
    case nonMrzDateOfBirth
    case nonMrzDateOfExpiry
    case nonMrzNationality
    case nonMrzSex
    case nonResident
    case nricNumber
    case numberOfDuplicates
    case occupation
    case oldNric
    case optional1
    case optional2
    case organDonor
    case parentNames
    case parentsGivenName
    case passportNumber
    case pdf417string
    case permitExpirationDate
    case permitIdentifier
    case permitIssueDate
    case personalIdentificationNumber
    case personalNumber
    case placeOfBirth
    case placeOfIssue
    case placeOfOrigin
    case primaryId
    case principalResidence
    case province
    case race
    case raceEthnicity
    case rawData
    case referenceNumber
    case religion
    case residenceCity
    case residenceFullAddress
    case residenceJurisdictionCode
    case residencePostalCode
    case residenceStreetAddress
    case residenceStreetAddress2
    case residentialStatus
    case rt
    case rw
    case secondaryId
    case sector
    case securityVersion
    case serialNo
    case sex
    case signature
    case socialSecurityNumber
    case specialRemarks
    case standardEndorsementCode
    case standardRestrictionCode
    case standardVehicleClassification
    case standardVersionNumber
    case state
    case street
    case surnameAtBirth
    case under18
    case under19
    case under21
    case uniqueCustomerId
    case validFrom
    case validUntil
    case vehicleCategories
    case veteran
    case weightKilograms
    case weightPounds
    case weightRange
    case zipCode

    /// Localized value of the key
    public var localized: String {
        if self == .cnp || self == .curp {
            return  Bundle.frameworkBundle.localizedString(_key, Bundle.nonLocalizableStringTable)
        } else {
            return Bundle.frameworkBundle.localizedString(_key, Bundle.fieldsStringTable)
        }
    }

    public static func < (lhs: MBFieldKey, rhs: MBFieldKey) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    private var _key: String {
        switch self {
        case .address:
            return "address"
        case .addressChangeDate:
            return "addressChangeDate"
        case .addressCity:
            return "addressCity"
        case .addressHouseNumber:
            return "addressHouseNumber"
        case .addressJurisdictionCode:
            return "addressJurisdictionCode"
        case .addressState:
            return "addressState"
        case .addressStreet:
            return "addressStreet"
        case .addressStreet2:
            return "addressStreet2"
        case .addressZipCode:
            return "addressZipCode"
        case .akaDateOfBirth:
            return "akaDateOfBirth"
        case .akaFullName:
            return "akaFullName"
        case .akaGivenName:
            return "akaGivenName"
        case .akaMiddleName:
            return "akaMiddleName"
        case .akaPrefixName:
            return "akaPrefixName"
        case .akaSocialSecurityNumber:
            return "akaSocialSecurityNumber"
        case .akaSuffixName:
            return "akaSuffixName"
        case .alienNumber:
            return "alienNumber"
        case .applicationReceiptNumber:
            return "applicationReceiptNumber"
        case .armyId:
            return "armyId"
        case .armyNumber:
            return "armyNumber"
        case .auditInformation:
            return "auditInformation"
        case .authority:
            return "authority"
        case .birthData:
            return "birthData"
        case .bloodGroup:
            return "bloodGroup"
        case .bloodType:
            return "bloodType"
        case .cardNumber:
            return "cardNumber"
        case .canNumber:
            return "canNumber"
        case .cardRevisionDate:
            return "cardRevisionDate"
        case .cardVersion:
            return "cardVersion"
        case .citizenship:
            return "citizenship"
        case .city:
            return "city"
        case .civilIdNumber:
            return "civilIdNumber"
        case .civilStatusNumber:
            return "civilStatusNumber"
        case .cnp:
            return "cnp"
        case .commercialCode:
            return "commercialCode"
        case .companyName:
            return "companyName"
        case .complianceType:
            return "complianceType"
        case .country:
            return "country"
        case .countryIdentification:
            return "countryIdentification"
        case .countryOfBirth:
            return "countryOfBirth"
        case .curp:
            return "curp"
        case .dataDiscriminator:
            return "dataDiscriminator"
        case .dateOfBirth:
            return "dateOfBirth"
        case .dateOfExpiry:
            return "dateOfExpiry"
        case .dateOfIssue:
            return "dateOfIssue"
        case .dateOfIssueB10:
            return "dateOfIssueB10"
        case .dateOfIssueB10NotSpecified:
            return "dateOfIssueB10NotSpecified"
        case .district:
            return "district"
        case .dlClass:
            return "dlClass"
        case .documentCode:
            return "documentCode"
        case .documentDataMatch:
            return "documentDataMatch"
        case .documentDiscriminator:
            return "documentDiscriminator"
        case .documentExpirationDate:
            return "documentExpirationDate"
        case .documentExpirationMonth:
            return "documentExpirationMonth"
        case .documentNonexpiring:
            return "documentNonexpiring"
        case .documentNumber:
            return "documentNumber"
        case .documentType:
            return "documentType"
        case .donorIndicator:
            return "donorIndicator"
        case .driverNumber:
            return "driverNumber"
        case .driverRestrictions:
            return "driverRestrictions"
        case .electorKey:
            return "electorKey"
        case .employer:
            return "employer"
        case .employerAddress:
            return "employerAddress"
        case .expiryDatePermanent:
            return "expiryDatePermanent"
        case .extendedNricNumber:
            return "extendedNricNumber"
        case .eyeColour:
            return "eyeColour"
        case .facultyAddress:
            return "facultyAddress"
        case .familyName:
            return "familyName"
        case .familyNameTruncation:
            return "familyNameTruncation"
        case .fathersName:
            return "fathersName"
        case .federalCommercialVehicleCodes:
            return "federalCommercialVehicleCodes"
        case .fingerprint:
            return "fingerprint"
        case .firstName:
            return "firstName"
        case .firstNameTruncation:
            return "firstNameTruncation"
        case .fullAddress:
            return "fullAddress"
        case .fullName:
            return "fullName"
        case .givenName:
            return "givenName"
        case .hairColor:
            return "hairColor"
        case .hazmatExpirationDate:
            return "hazmatExpirationDate"
        case .height:
            return "height"
        case .heightCm:
            return "heightCm"
        case .heightIn:
            return "heightIn"
        case .houseNumber:
            return "houseNumber"
        case .idSeries:
            return "idSeries"
        case .identityCardNumber:
            return "identityCardNumber"
        case .immigrantCaseNumber:
            return "immigrantCaseNumber"
        case .inventoryControlNumber:
            return "inventoryControlNumber"
        case .isUncertain:
            return "isUncertain"
        case .issueTimestamp:
            return "issueTimestamp"
        case .issuer:
            return "issuer"
        case .issuerIdentificationNumber:
            return "issuerIdentificationNumber"
        case .issuingAgency:
            return "issuingAgency"
        case .issuingAuthority:
            return "issuingAuthority"
        case .issuingJurisdiction:
            return "issuingJurisdiction"
        case .issuingJurisdictionName:
            return "issuingJurisdictionName"
        case .jmbg:
            return "jmbg"
        case .jurisdictionEndorsementCodes:
            return "jurisdictionEndorsementCodes"
        case .jurisdictionEndorsmentCodeDescription:
            return "jurisdictionEndorsmentCodeDescription"
        case .jurisdictionRestrictionCodeDescription:
            return "jurisdictionRestrictionCodeDescription"
        case .jurisdictionRestrictionCodes:
            return "jurisdictionRestrictionCodes"
        case .jurisdictionVehicleClass:
            return "jurisdictionVehicleClass"
        case .jurisdictionVehicleClassificationDescription:
            return "jurisdictionVehicleClassificationDescription"
        case .jurisdictionVersionNumber:
            return "jurisdictionVersionNumber"
        case .kelDesa:
            return "kelDesa"
        case .lastName:
            return "lastName"
        case .licenseCategories:
            return "licenseCategories"
        case .licenseClass:
            return "licenseClass"
        case .licenseNumber:
            return "licenseNumber"
        case .licenseType:
            return "licenseType"
        case .limitedDurationDocument:
            return "limitedDurationDocument"
        case .maritalStatus:
            return "maritalStatus"
        case .marriageStatus:
            return "marriageStatus"
        case .medicalIndicator:
            return "medicalIndicator"
        case .middleName:
            return "middleName"
        case .middleNameTruncation:
            return "middleNameTruncation"
        case .mothersName:
            return "mothersName"
        case .mrtdVerified:
            return "mrtdVerified"
        case .mrzParsed:
            return "mrzParsed"
        case .mrzText:
            return "mrzText"
        case .namePrefix:
            return "namePrefix"
        case .nameSuffix:
            return "nameSuffix"
        case .nationalNumber:
            return "nationalNumber"
        case .nationality:
            return "nationality"
        case .nonMrzDateOfBirth:
            return "nonMrzDateOfBirth"
        case .nonMrzDateOfExpiry:
            return "nonMrzDateOfExpiry"
        case .nonMrzNationality:
            return "nonMrzNationality"
        case .nonMrzSex:
            return "nonMrzSex"
        case .nonResident:
            return "nonResident"
        case .nricNumber:
            return "nricNumber"
        case .numberOfDuplicates:
            return "numberOfDuplicates"
        case .occupation:
            return "occupation"
        case .oldNric:
            return "oldNric"
        case .optional1:
            return "optional1"
        case .optional2:
            return "optional2"
        case .organDonor:
            return "organDonor"
        case .parentNames:
            return "parentNames"
        case .parentsGivenName:
            return "parentsGivenName"
        case .passportNumber:
            return "passportNumber"
        case .pdf417string:
            return "pdf417string"
        case .permitExpirationDate:
            return "permitExpirationDate"
        case .permitIdentifier:
            return "permitIdentifier"
        case .permitIssueDate:
            return "permitIssueDate"
        case .personalIdentificationNumber:
            return "personalIdentificationNumber"
        case .personalNumber:
            return "personalNumber"
        case .placeOfBirth:
            return "placeOfBirth"
        case .placeOfIssue:
            return "placeOfIssue"
        case .placeOfOrigin:
            return "placeOfOrigin"
        case .primaryId:
            return "primaryId"
        case .principalResidence:
            return "principalResidence"
        case .province:
            return "province"
        case .race:
            return "race"
        case .raceEthnicity:
            return "raceEthnicity"
        case .rawData:
            return "rawData"
        case .referenceNumber:
            return "referenceNumber"
        case .religion:
            return "religion"
        case .residenceCity:
            return "residenceCity"
        case .residenceFullAddress:
            return "residenceFullAddress"
        case .residenceJurisdictionCode:
            return "residenceJurisdictionCode"
        case .residencePostalCode:
            return "residencePostalCode"
        case .residenceStreetAddress:
            return "residenceStreetAddress"
        case .residenceStreetAddress2:
            return "residenceStreetAddress2"
        case .residentialStatus:
            return "residentialStatus"
        case .rt:
            return "rt"
        case .rw:
            return "rw"
        case .secondaryId:
            return "secondaryId"
        case .sector:
            return "sector"
        case .securityVersion:
            return "securityVersion"
        case .sex:
            return "sex"
        case .serialNo:
            return "serialNo"
        case .signature:
            return "signature"
        case .socialSecurityNumber:
            return "socialSecurityNumber"
        case .specialRemarks:
            return "specialRemarks"
        case .standardEndorsementCode:
            return "standardEndorsementCode"
        case .standardRestrictionCode:
            return "standardRestrictionCode"
        case .standardVehicleClassification:
            return "standardVehicleClassification"
        case .standardVersionNumber:
            return "standardVersionNumber"
        case .state:
            return "state"
        case .street:
            return "street"
        case .surnameAtBirth:
            return "surnameAtBirth"
        case .under18:
            return "under18"
        case .under19:
            return "under19"
        case .under21:
            return "under21"
        case .uniqueCustomerId:
            return "uniqueCustomerId"
        case .validFrom:
            return "validFrom"
        case .validUntil:
            return "validUntil"
        case .vehicleCategories:
            return "vehicleCategories"
        case .veteran:
            return "veteran"
        case .weightKilograms:
            return "weightKilograms"
        case .weightPounds:
            return "weightPounds"
        case .weightRange:
            return "weightRange"
        case .zipCode:
            return "zipCode"
        }
    }
}

/// Class representing one field, or result of document being scanned.
public class MBField: NSObject {
    /// Key describing the result
    @objc public let key: MBFieldKey
    
    /// Value or the result represented as String
    @objc public let value: String

    init(key: MBFieldKey, value: String?) {
        self.key = key
        self.value = value ?? ""
    }

    init(key: MBFieldKey, value: MBDateResult?) {
        self.key = key
        self.value = value?.stringDate ?? ""
    }

    init(key: MBFieldKey, value: Date?, rawDate: String? = nil) {
        self.key = key
        self.value = value?.customFormatValue() ?? rawDate ?? ""
    }

    init(key: MBFieldKey, value: Bool) {
        self.key = key
        self.value = value ? "true" : "false"
    }

    public override var description: String {
        return "\(key.localized) = \(value)"
    }
    
}
