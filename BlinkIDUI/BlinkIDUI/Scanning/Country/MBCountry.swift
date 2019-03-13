//
//  MBCountryProviderRepository.swift
//  BlinkID-app
//
//  Created by Jura Skrlec on 27/09/2017.
//  Copyright © 2017 Microblink. All rights reserved.
//

import Foundation

/// Enum defines that have their special recognizers
/// Other countries are supported through general recognizers
/// Example: all countires have passports that contain 'MRZ' which can be read using `MRTDRecognizer`s
@objc public enum MBSupportedCountry: Int, CaseIterable {
    case australia
    case austria
    case brunei
    case canada
    case colombia
    case croatia
    case cyprus
    case czechia
    case denmark
    case egypt
    case france
    case germany
    case hongKong
    case indonesia
    case ireland
    case italy
    case jordan
    case kuwait
    case nigeria
    case malaysia
    case mexico
    case morocco
    case newZealand
    case poland
    case qatar
    case singapore
    case slovakia
    case slovenia
    case southAfrica
    case spain
    case sweden
    case switzerland
    case unitedArabEmirates
    case unitedKingdom
    case unitedStatesOfAmerica

    static func create(fromCountryCode countryCode: String) -> MBSupportedCountry? {
        for supportedCountry in MBSupportedCountry.allCases where supportedCountry.countryCode == countryCode {
            return supportedCountry
        }
        return nil
    }

    public var countryCode: String {
        switch self {
        case .australia:
            return "AU"
        case .austria:
            return "AT"
        case .brunei:
            return "BN"
        case .canada:
            return "CA"
        case .colombia:
            return "CO"
        case .croatia:
            return "HR"
        case .cyprus:
            return "CY"
        case .czechia:
            return "CZ"
        case .denmark:
            return "DK"
        case .egypt:
            return "EG"
        case .france:
            return "FR"
        case .germany:
            return "DE"
        case .hongKong:
            return "HK"
        case .indonesia:
            return "ID"
        case .ireland:
            return "IE"
        case .italy:
            return "IT"
        case .jordan:
            return "JO"
        case .kuwait:
            return "KW"
        case .malaysia:
            return "MY"
        case .mexico:
            return "MX"
        case .morocco:
            return "MA"
        case .nigeria:
            return "NG"
        case .newZealand:
            return "NZ"
        case .poland:
            return "PL"
        case .qatar:
            return "QA"
        case .singapore:
            return "SG"
        case .slovakia:
            return "SK"
        case .slovenia:
            return "SI"
        case .southAfrica:
            return "ZA"
        case .spain:
            return "ES"
        case .sweden:
            return "SE"
        case .switzerland:
            return "CH"
        case .unitedArabEmirates:
            return "AE"
        case .unitedKingdom:
            return "GB"
        case .unitedStatesOfAmerica:
            return "US"
        }
    }

    var countryProvider: MBCountryProvider {
        switch self {
        case .australia:
            return MBAustraliaCountryProvider()
        case .austria:
            return MBAustriaCountryProvider()
        case .brunei:
            return MBBruneiCountryProvider()
        case .canada:
            return MBCanadaCountryProvider()
        case .colombia:
            return MBColombiaCountryProvider()
        case .croatia:
            return MBCroatiaCountryProvider()
        case .cyprus:
            return MBCyprusCountryProvider()
        case .czechia:
            return MBCzechCountryProvider()
        case .denmark:
            return MBDenmarkCountryProvider()
        case .egypt:
            return MBEgyptCountryProvider()
        case .france:
            return MBFranceCountryProvider()
        case .germany:
            return MBGermanyCountryProvider()
        case .hongKong:
            return MBHongKongCountryProvider()
        case .indonesia:
            return MBIndonesiaCountryProvider()
        case .ireland:
            return MBIrelandCountryProvider()
        case .italy:
            return MBItalyCountryProvider()
        case .jordan:
            return MBJordanCountryProvider()
        case .kuwait:
            return MBKuwaitCountryProvider()
        case .malaysia:
            return MBMalaysiaCountryProvider()
        case .mexico:
            return MBMexicoCountryProvider()
        case .morocco:
            return MBMoroccoCountryProvider()
        case .nigeria:
            return MBNigeriaCountryProvider()
        case .newZealand:
            return MBNewZealandCountryProvider()
        case .poland:
            return MBPolandCountryProvider()
        case .qatar:
            return MBQatarCountryProvider()
        case .singapore:
            return MBSingaporeCountryProvider()
        case .slovakia:
            return MBSlovakCountryProvider()
        case .slovenia:
            return MBSloveniaCountryProvider()
        case .southAfrica:
            return MBSouthAfricaCountryProvider()
        case .spain:
            return MBSpainCountryProvider()
        case .sweden:
            return MBSwedenCountryProvider()
        case .switzerland:
            return MBSwitzerlandCountryProvider()
        case .unitedArabEmirates:
            return MBUAECountryProvider()
        case .unitedKingdom:
            return MBUKCountryProvider()
        case .unitedStatesOfAmerica:
            return MBUSACountryProvider()
        }
    }

}

/// Class containing country code for countries and country providers
@objc public class MBCountry: NSObject, MBLocalizable {

    /// Country code that matches the values found in `NSLocale.isoCountryCode`
    @objc public let countryCode: String
    /// `MBCountryProvider` instance represents all the documents that are supported for this country
    @objc public let countryProvider: MBCountryProvider

    /// Localized country name based on the country code value
    @objc public var localized: String {
        guard let languageCode = Locale.current.languageCode else {
            return  Locale(identifier: "en").localizedString(forRegionCode: countryCode) ?? "Unknow country"
        }
        return Locale(identifier: languageCode).localizedString(forRegionCode: countryCode) ?? "Unknow country"
    }

    /// Initializes the country using the current device region code.
    @objc public convenience override init() {
        let countryCode = NSLocale.current.regionCode ?? MBSupportedCountry.unitedStatesOfAmerica.countryCode
        self.init(countryCode: countryCode,
                  countryProvider: MBSupportedCountry.create(fromCountryCode: countryCode)?.countryProvider ?? MBDefaultCountryProvider())
    }

    /// Initialize country using one of the `MBSupportedCountry` enum values
    ///
    /// - Parameter supportedCountry: supported country
    @objc public convenience init(supportedCountry: MBSupportedCountry) {
        self.init(countryCode: supportedCountry.countryCode,
                  countryProvider: supportedCountry.countryProvider)
    }

    /// Initialize country using a country code
    ///
    /// - Parameter countryCode: countryCode
    @objc public convenience init(countryCode: String) {
        self.init(countryCode: countryCode,
                  countryProvider: MBSupportedCountry.create(fromCountryCode: countryCode)?.countryProvider ?? MBDefaultCountryProvider())
    }

    /// Intialize country using a country code and country document provider
    ///
    /// - Parameters:
    ///   - countryCode: country code
    ///   - countryProvider: country document provider
    @objc public required init(countryCode: String, countryProvider: MBCountryProvider) {
        self.countryCode = countryCode
        self.countryProvider = countryProvider
    }

    /// Used to compare `MBCountry` type and `MBSupportedCountry` type
    /// Needed because `MBSupportedCountry.countryCode` var in `MBSupportedCountry` can't be exposed to objc
    ///
    /// - Parameter supportedCountry: MBSupportedCountry
    /// - Returns: true if countryCodes match otherwise false
    @objc public func isEqual(toSupportedCountry supportedCountry: MBSupportedCountry) -> Bool {
        return self.countryCode == supportedCountry.countryCode
    }
    
    static func == (lhs: MBCountry, rhs: MBCountry) -> Bool {
        return lhs.countryCode == rhs.countryCode
    }
    
    /// Returns all countries provided by `NSLocale.isoCountryCodes`
    ///
    /// - Returns: all countries defined in NSLocale.isoCountryCodes
    @objc public class func getAllCountries() -> [MBCountry] {
        return NSLocale.isoCountryCodes.map({ (countryCode) -> MBCountry in
            MBCountry(countryCode: countryCode)
        })
    }
}
