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
    case addressCity
    case addressJurisdictionCode
    case addressStreet
    case addressStreet2
    case akaDateOfBirth
    case akaFamilyName
    case akaFullName
    case akaGivenName
    case akaMiddleName
    case akaPrefixName
    case akaSocialSecurityNumber
    case akaSuffixName
    case alienNumber
    case applicationReceiptNumber
    case armyNumber
    case auditInformation
    case authority
    case birthData
    case bloodGroup
    case canNumber
    case cardRevisionDate
    case citizenship
    case city
    case civilIdNumber
    case civilStatusNumber
    case cnp
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
    case dlClass
    case documentCode
    case documentDiscriminator
    case documentExpirationMonth
    case documentNonexpiring
    case documentNumber
    case documentType
    case driverNumber
    case driverRestrictions
    case employer
    case employerAddress
    case expiryDatePermanent
    case eyeColour
    case facultyAddress
    case familyName
    case familyNameTruncation
    case federalCommercialVehicleCodes
    case firstName
    case firstNameTruncation
    case fullAddress
    case fullName
    case hairColor
    case hazmatExpirationDate
    case height
    case heightCm
    case heightIn
    case idSeries
    case identityCardNumber
    case immigrantCaseNumber
    case inventoryControlNumber
    case issueTimestamp
    case issuer
    case issuerIdentificationNumber
    case issuingAgency
    case issuingAuthority
    case issuingJurisdiction
    case issuingJurisdictionName
    case jurisdictionEndorsementCodes
    case jurisdictionEndorsmentCodeDescription
    case jurisdictionRestrictionCodeDescription
    case jurisdictionRestrictionCodes
    case jurisdictionVehicleClass
    case jurisdictionVehicleClassificationDescription
    case jurisdictionVersionNumber
    case lastName
    case licenseCategories
    case licenseNumber
    case licenseType
    case limitedDurationDocument
    case maritalStatus
    case medicalIndicator
    case middleName
    case middleNameTruncation
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
    case parentsGivenName
    case passportNumber
    case permitExpirationDate
    case permitIdentifier
    case permitIssueDate
    case personalIdentificationNumber
    case placeOfBirth
    case placeOfIssue
    case placeOfOrigin
    case primaryId
    case principalResidence
    case province
    case rank
    case race
    case raceEthnicity
    case rawData
    case religion
    case residenceCity
    case residenceFullAddress
    case residenceJurisdictionCode
    case residencePostalCode
    case residenceStreetAddress
    case residenceStreetAddress2
    case residentialStatus
    case secondaryId
    case sector
    case securityVersion
    case serialNo
    case sex
    case socialSecurityNumber
    case specialRemarks
    case standardEndorsementCode
    case standardRestrictionCode
    case standardVehicleClassification
    case standardVersionNumber
    case surnameAtBirth
    case under18
    case under19
    case under21
    case uniqueCustomerId
    case vehicleCategories
    case veteran
    case weightKilograms
    case weightPounds
    case weightRange

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
        case .addressCity:
            return "addressCity"
       
        case .addressJurisdictionCode:
            return "addressJurisdictionCode"
        case .addressStreet:
            return "addressStreet"
        case .addressStreet2:
            return "addressStreet2"
        case .akaDateOfBirth:
            return "akaDateOfBirth"
        case .akaFamilyName:
            return "akaFamilyName"
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
        case .canNumber:
            return "canNumber"
        case .cardRevisionDate:
            return "cardRevisionDate"
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
        case .dlClass:
            return "dlClass"
        case .documentCode:
            return "documentCode"
        case .documentDiscriminator:
            return "documentDiscriminator"
        case .documentExpirationMonth:
            return "documentExpirationMonth"
        case .documentNonexpiring:
            return "documentNonexpiring"
        case .documentNumber:
            return "documentNumber"
        case .documentType:
            return "documentType"
        case .driverNumber:
            return "driverNumber"
        case .driverRestrictions:
            return "driverRestrictions"
        case .employer:
            return "employer"
        case .employerAddress:
            return "employerAddress"
        case .expiryDatePermanent:
            return "expiryDatePermanent"
        case .eyeColour:
            return "eyeColour"
        case .facultyAddress:
            return "facultyAddress"
        case .familyName:
            return "familyName"
        case .familyNameTruncation:
            return "familyNameTruncation"
        case .federalCommercialVehicleCodes:
            return "federalCommercialVehicleCodes"
        case .firstName:
            return "firstName"
        case .firstNameTruncation:
            return "firstNameTruncation"
        case .fullAddress:
            return "fullAddress"
        case .fullName:
            return "fullName"
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
        case .idSeries:
            return "idSeries"
        case .identityCardNumber:
            return "identityCardNumber"
        case .immigrantCaseNumber:
            return "immigrantCaseNumber"
        case .inventoryControlNumber:
            return "inventoryControlNumber"
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
        case .lastName:
            return "lastName"
        case .licenseCategories:
            return "licenseCategories"
        case .licenseNumber:
            return "licenseNumber"
        case .licenseType:
            return "licenseType"
        case .limitedDurationDocument:
            return "limitedDurationDocument"
        case .maritalStatus:
            return "maritalStatus"
        case .medicalIndicator:
            return "medicalIndicator"
        case .middleName:
            return "middleName"
        case .middleNameTruncation:
            return "middleNameTruncation"
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
        case .parentsGivenName:
            return "parentsGivenName"
        case .passportNumber:
            return "passportNumber"
        case .permitExpirationDate:
            return "permitExpirationDate"
        case .permitIdentifier:
            return "permitIdentifier"
        case .permitIssueDate:
            return "permitIssueDate"
        case .personalIdentificationNumber:
            return "personalIdentificationNumber"
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
        case .rank:
            return "rank"
        case .race:
            return "race"
        case .raceEthnicity:
            return "raceEthnicity"
        case .rawData:
            return "rawData"
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
