//
//  MBDocumentProviderProtocol.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 26/09/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import UIKit

/// Enum presenting the available document types that can be scanned.
@objc public enum MBDocumentType: Int, MBLocalizable, Comparable {
    /// Identity Card
    case identityCard
    /// Some countries have two versions of Identitiy Cards
    /// This is used to distinct them
    case oldID
    /// Some countries have two versions of Identitiy Cards
    /// This is used to distinct them
    case newID
    /// Malaysian identity Card (MyKad)
    case malaysianID
    /// Military Identity Card(MyTentera)
    case militaryID
    /// Military Identity Card(Military ID)
    case militaryIDDefault
    /// Permanent Resident Identity Card(MyPr)
    case permanentResidentID
    /// Temporary Resident Identity Card(MyKas)
    case temporaryResidentID
    /// Immigrator Identity Card
    case immigratorID
    /// Driver's License
    case driverLicense
    /// Passport
    case passport
    /// Visa
    case visa
    /// Temporary Residence Permit
    case temporaryResidencePermit
    /// Residence Permit
    case residencePermit
    /// Australia Victoria Driver's License
    case victoriaDriverLicense
    /// Work pass
    case workPass
    /// Singapore ID (Blue & Pink)
    case idBluePink
    /// Voter ID
    case voterID
    /// Under 21 ID
    case under21ID
    /// Undefined
    case unknown

    public var localized: String {
        let settings = MBBlinkSettings.sharedInstance.languageSettings
        switch self {
        case .identityCard:
            return settings.identityCardText
        case .oldID:
            return settings.oldIDCardText
        case .newID:
            return settings.newIDCardText
        case .malaysianID:
            return settings.malaysianIDCardText
        case .militaryID:
            return settings.militaryIDCardText
        case .militaryIDDefault:
            return settings.militaryIDDefaultCardText
        case .permanentResidentID:
            return settings.permanentResidentIDCardText
        case .temporaryResidentID:
            return settings.temporaryResidentIDCardText
        case .immigratorID:
            return settings.immigratorIDCardText
        case .driverLicense:
            return settings.driversLicenseText
        case .passport:
            return settings.passportText
        case .visa:
            return settings.visaText
        case .temporaryResidencePermit:
            return settings.temporaryResidencePermitText
        case .residencePermit:
            return settings.residencePermitText
        case .victoriaDriverLicense:
            return settings.victoriaDriversLicenseText
        case .workPass:
            return settings.workPassText
        case .idBluePink:
            return settings.idBluePinkText
        case .voterID:
            return settings.voterIDCardText
        case .under21ID:
            return settings.under21IDCardText
        case .unknown:
            return "unknown"
        }
    }

    public static func < (lhs: MBDocumentType, rhs: MBDocumentType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
