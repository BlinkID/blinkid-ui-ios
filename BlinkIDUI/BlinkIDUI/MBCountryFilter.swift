//
//  MBCountryFilter.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 14/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

/// Protocol used to describe a country filter used in country selection view controller.
/// Use it to filter countries you want to show your users.
@objc public protocol MBCountryFilter: AnyObject {
    
    /// Filter's an array of countries, create a new array of fitlered countries
    /// based on the filter implemented in the method
    ///
    /// - Parameter countries: array of countries
    /// - Returns: filtered array of countries
    @objc func filter(countries: [MBCountry]) -> [MBCountry]
    
}

// MARK: Default Country Filters

/// Class will return an array of countries that match the provided set of country codes.
@objc public class MBWhitelistCountryFilter: NSObject, MBCountryFilter {
    let whitelistedCountryCodes: Set<String>

    /// Creates an instance of `MBWhitelistCountryFilter` that will filter out the countries
    /// not provided through `MBWhitelistCountryFilter.whitelistedCountryCodes` parameter.
    ///
    /// - Parameter whitelistedCountryCodes: countries that won't be removed.
    @objc public required init(whitelistedCountryCodes: Set<String>) {
        self.whitelistedCountryCodes = whitelistedCountryCodes
    }

    @objc public func filter(countries: [MBCountry]) -> [MBCountry] {
        return countries.filter { (country) -> Bool in whitelistedCountryCodes.contains(country.countryCode) }
    }

}

/// Class will return an array of countries that don't match the provided set of country codes.
@objc public class MBBlacklistCountryFilter: NSObject, MBCountryFilter {
    let blacklistedCountryCodes: Set<String>

    /// Creates an instance of `MBBlacklistCountryFilter` that will filter out the countries
    ///  provided through `MBBlacklistCountryFilter.blacklistedCountryCodes` parameter.
    ///
    /// - Parameter blacklistedCountryCodes: countries that will be removed
    @objc public required init(blacklistedCountryCodes: Set<String>) {
        self.blacklistedCountryCodes = blacklistedCountryCodes
    }

    @objc public func filter(countries: [MBCountry]) -> [MBCountry] {
        return countries.filter { (country) -> Bool in !blacklistedCountryCodes.contains(country.countryCode) }
    }

}

/// Class will return same array as provided through filter method.
@objc public class MBAllowAllCountryFilter: NSObject, MBCountryFilter {
    
    @objc public func filter(countries: [MBCountry]) -> [MBCountry] {
        return countries
    }
    
}
