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
    case addressStreet
    case alienNumber
    case applicationReceiptNumber
    case armyNumber
    case authority
    case barcodeData
    case birthData
    case bloodGroup
    case canNumber
    case citizenship
    case city
    case civilIdNumber
    case civilStatusNumber
    case cnp
    case country
    case countryOfBirth
    case curp
    case dateOfBirth
    case dateOfExpiry
    case dateOfIssue
    case dateOfIssueB10
    case dlClass
    case documentCode
    case documentNumber
    case driverNumber
    case driverRestrictions
    case employer
    case employerAddress
    case endorsements
    case expiryDatePermanent
    case eyeColour
    case facultyAddress
    case familyName
    case firstName
    case fullAddress
    case fullName
    case height
    case idSeries
    case identityCardNumber
    case immigrantCaseNumber
    case issuer
    case issuingAgency
    case issuingAuthority
    case lastName
    case licenseCategories
    case licenseNumber
    case licenseType
    case maritalStatus
    case mrzText
    case nationalNumber
    case nationality
    case nonMrzDateOfBirth
    case nonMrzDateOfExpiry
    case nonMrzNationality
    case nonMrzSex
    case nricNumber
    case occupation
    case oldNric
    case optional1
    case optional2
    case parentsGivenName
    case passportNumber
    case personalIdentificationNumber
    case placeOfBirth
    case placeOfIssue
    case placeOfOrigin
    case primaryId
    case principalResidence
    case province
    case rank
    case race
    case religion
    case residenceFullAddress
    case residentialStatus
    case secondaryId
    case sector
    case serialNo
    case sex
    case specialRemarks
    case surnameAtBirth
    case vehicleCategories
    case vehicleClass

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
        case .addressStreet:
            return "addressStreet"
        case .alienNumber:
            return "alienNumber"
        case .applicationReceiptNumber:
            return "applicationReceiptNumber"
        case .armyNumber:
            return "armyNumber"
        case .authority:
            return "authority"
        case .barcodeData:
            return "barcodeData"
        case .birthData:
            return "birthData"
        case .bloodGroup:
            return "bloodGroup"
        case .canNumber:
            return "canNumber"
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
        case .country:
            return "country"
        case .countryOfBirth:
            return "countryOfBirth"
        case .curp:
            return "curp"
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
        case .documentNumber:
            return "documentNumber"
        case .driverNumber:
            return "driverNumber"
        case .driverRestrictions:
            return "driverRestrictions"
        case .employer:
            return "employer"
        case .employerAddress:
            return "employerAddress"
        case .endorsements:
            return "endorsements"
        case .expiryDatePermanent:
            return "expiryDatePermanent"
        case .eyeColour:
            return "eyeColour"
        case .facultyAddress:
            return "facultyAddress"
        case .familyName:
            return "familyName"
        case .firstName:
            return "firstName"
        case .fullAddress:
            return "fullAddress"
        case .fullName:
            return "fullName"
        case .height:
            return "height"
        case .idSeries:
            return "idSeries"
        case .identityCardNumber:
            return "identityCardNumber"
        case .immigrantCaseNumber:
            return "immigrantCaseNumber"
        case .issuer:
            return "issuer"
        case .issuingAgency:
            return "issuingAgency"
        case .issuingAuthority:
            return "issuingAuthority"
        case .lastName:
            return "lastName"
        case .licenseCategories:
            return "licenseCategories"
        case .licenseNumber:
            return "licenseNumber"
        case .licenseType:
            return "licenseType"
        case .maritalStatus:
            return "maritalStatus"
        case .mrzText:
            return "mrzText"
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
        case .nricNumber:
            return "nricNumber"
        case .occupation:
            return "occupation"
        case .oldNric:
            return "oldNric"
        case .optional1:
            return "optional1"
        case .optional2:
            return "optional2"
        case .parentsGivenName:
            return "parentsGivenName"
        case .passportNumber:
            return "passportNumber"
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
        case .religion:
            return "religion"
        case .residenceFullAddress:
            return "residenceFullAddress"
        case .residentialStatus:
            return "residentialStatus"
        case .secondaryId:
            return "secondaryId"
        case .sector:
            return "sector"
        case .sex:
            return "sex"
        case .serialNo:
            return "serialNo"
        case .specialRemarks:
            return "specialRemarks"
        case .surnameAtBirth:
            return "surnameAtBirth"
        case .vehicleCategories:
            return "vehicleCategories"
        case .vehicleClass:
            return "vehicleClass"
        }
    }
}

/// Class representing one field, or result of document being scanned.
public class MBField: NSObject {
    /// Key describing the result
    @objc public let key: MBFieldKey
    
    /// Value or the result represented as String
    @objc public let value: MBValue?

    init(key: MBFieldKey, value: String?) {
        self.key = key
        if let value = value {
            self.value = MBStringValue(value: value)
        } else {
            self.value = nil
        }
    }

    init(key: MBFieldKey, value: MBDateResult?) {
        self.key = key
        if let value = value {
            self.value = MBDateValue(value: value)
        } else {
            self.value = nil
        }
    }

    init(key: MBFieldKey, value: Bool) {
        self.key = key
        self.value = MBBoolValue(value: value)
    }

    public override var description: String {
        return "\(key.localized) = \(value)"
    }
    
}
