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
    /// Military Identity Card(MyTentera)
    case militaryID
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
    /// Residence Permit
    case residencePermit
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
        case .militaryID:
            return settings.militaryIDCardText
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
        case .residencePermit:
            return settings.residencePermitText
        case .unknown:
            return "unknown"
        }
    }

    public static func < (lhs: MBDocumentType, rhs: MBDocumentType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
