//
//  MBCountryDataSource.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 15/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

class MBCountryListManager {

    // MARK: - Private -
    
    private var _countryFilter: MBCountryFilter {
        didSet {
            _countries = _countryFilter.filter(countries: _countries)
        }
    }

    private var _countries: [MBCountry] = MBCountry.getAllCountries()

    private var _sections = [String: [MBCountry]]()
    private var _sectionTitles: [String]

    private var _isFiltered = false
    private var _filteredCountries = [MBCountry]()
    
    var numberOfCountries: Int {
        if _isFiltered {
            return _filteredCountries.count
        } else {
            return _countries.count
        }
    }

    // MARK: - Initializer -
    
    init() {
        _countryFilter = MBBlinkSettings.sharedInstance.documentChooserSettings.countryFilter
        _countries = _countryFilter.filter(countries: _countries)

        let firstLetters = [MBCountry](_countries)
            .map({ $0.localized.prefix(1).uppercased() })
        _sectionTitles = Set(firstLetters).sorted()

        for country in _countries {
            let firstLetter = country.localized.prefix(1).uppercased()
            if _sections[firstLetter] != nil {
                _sections[firstLetter]?.append(country)
            } else {
                _sections[firstLetter] = [country]
            }
        }
    }
    
    // MARK: - List Manger Methods -

    func indexPath(forCountry country: MBCountry) -> IndexPath {
        if !_isFiltered {
            let sectionTitle = String(country.localized.prefix(1))
            let sectionIndex = _sectionTitles.firstIndex(of: sectionTitle) ?? 0
            let countryIndex = _sections[sectionTitle]?.firstIndex(where: { $0 == country }) ?? 0
            return IndexPath(row: countryIndex, section: sectionIndex)
        } else {
            let countryIndex = _filteredCountries.firstIndex(where: { $0 == country }) ?? 0
            return IndexPath(row: countryIndex, section: 0)
        }
    }

    func numberOfSections() -> Int {
        if _isFiltered {
            return 1
        } else {
            return _sections.count
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        if _isFiltered {
            return _filteredCountries.count
        } else {
            guard let countries = _sections[_sectionTitles[section]] else { return 0 }
            return countries.count
        }
    }

    func titleFor(section: Int) -> String? {
        if _isFiltered {
            return nil
        } else {
            return _sectionTitles[section]
        }
    }

    func sectionTitles() -> [String]? {
        if _isFiltered {
            return nil
        } else {
            return _sectionTitles
        }
    }

    func countryFor(indexPath: IndexPath) -> MBCountry {
        if _isFiltered {
            return _filteredCountries[indexPath.row]
        } else if let section = _sections[_sectionTitles[indexPath.section]] {
            return section[indexPath.row]
        }
        fatalError("All countries should be listed for every index path")
    }

    func filterCountries(withSearchText searchText: String) {
        _isFiltered = !searchText.isEmpty
        guard _isFiltered else {
            return
        }
        let lowercasedSearchText = searchText.lowercased()

        _filteredCountries = _countries.filter({ $0.localized.lowercased().hasPrefix(searchText.lowercased()) || $0.localized.lowercased().range(of: " \(lowercasedSearchText)") != nil })
            .sorted(by: { (country1, country2) -> Bool in
                if country1.localized.lowercased().starts(with: lowercasedSearchText) {
                    return true
                }
                if country2.localized.lowercased().starts(with: lowercasedSearchText) {
                    return false
                }
                return country1.localized < country2.localized
        })
    }

    func resetFilter() {
        _isFiltered = false
    }
}
