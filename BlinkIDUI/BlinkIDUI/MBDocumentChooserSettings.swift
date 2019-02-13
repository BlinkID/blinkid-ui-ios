//
//  MBDocumentChooserSettings.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 28/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

/// Protocol used for setting up Document chooser settings
/// These settings setup the following:
/// - country table view controller for picking the country
/// - document tabs used to pick the document
/// - country button used by default to open country table view controller
/// - filtering both countries through countryFilter and document types through
///         `MBDocumentChooserSettings.isDocument(...)`
@objc public protocol MBDocumentChooserSettings: AnyObject {
    
    @objc weak var blinkIDUI: MBBlinkIDUI? { get set }
    
    /// Filter for countries in country selection view controller.
    /// - Default: MBAllowAllCountryFilter - all countries are allowed.
    @objc var countryFilter: MBCountryFilter { get set }
    
    /// Show/hide document tabs view.
    /// - Default: true
    @objc var shouldShowDocumentTypeTabs: Bool { get set }
    
    /// Show/hide country chooser button.
    /// - Default: true
    @objc var shouldShowCountryChooser: Bool { get set }
    
    /// Minimum number of rows to show section indexer sidebar in selection view controller.
    /// Default: 50
    @objc var sectionIndexMinimumDisplayRowCount: Int { get set }
    
    /// Checks if document is supported by the country. This is used to display proper document selection tabs for the country.
    /// You can use this function to filter document types by countries.
    ///
    /// - Parameters:
    ///   - document: document type that is being tested if it's supported.
    ///   - country: country that is selected.
    /// - Returns: if the document is supported by the country
    @objc func isDocument(document: MBDocumentType, supportedForCountry country: MBCountry) -> Bool
    
    /// Default document type that will be set as selected when country is changed.
    ///
    /// - Parameter country: country that was selected
    /// - Returns: document type that will be selected
    @objc func defaultDocumentTypeForCountry(country: MBCountry) -> MBDocumentType
    
    /// Event called once the document choose country button was tapped
    ///
    /// - Parameter documentChooserViewController: view controller used to select documents and countries
    @objc func didTapChooseCountry(documentChooserViewController: MBDocumentChooserViewController)
    
}

/// Default implementation of `MBDocumentChooserSettings`.
@objc open class MBDefaultDocumentChooserSettings: NSObject, MBDocumentChooserSettings {
    
    @objc weak public var blinkIDUI: MBBlinkIDUI?
    
    /// Filter for countries in country selection view controller.
    /// - Default: MBAllowAllCountryFilter - all countries are allowed.
    @objc open var countryFilter: MBCountryFilter = MBAllowAllCountryFilter()
    
    /// Show/hide document tabs view.
    /// - Default: true
    @objc open var shouldShowDocumentTypeTabs: Bool = true
    
    /// Show/hide country chooser button.
    /// - Default: true
    @objc open var shouldShowCountryChooser: Bool = true
    
    /// Minimum number of rows to show section indexer sidebar in selection view controller.
    /// Default: 50
    @objc open var sectionIndexMinimumDisplayRowCount: Int = 50
    
    /// Checks if document is supported by the country. This is used to display proper document selection tabs for the country.
    /// You can use this function to filter document types by countries.
    ///
    /// - Parameters:
    ///   - document: document type that is being tested if it's supported.
    ///   - country: country that is selected.
    /// - Returns: if the document is supported by the country
    @objc open func isDocument(document: MBDocumentType, supportedForCountry country: MBCountry) -> Bool {
        return country.countryProvider.supportedDocuments.contains(document)
    }
    
    /// Default document type that will be set as selected when country is changed.
    ///
    /// - Parameter country: country that was selected
    /// - Returns: document type that will be selected
    @objc open func defaultDocumentTypeForCountry(country: MBCountry) -> MBDocumentType {
        guard let documentType = country.countryProvider.supportedDocuments.first else {
            fatalError("Country \(country.localized) with country code \(country.countryCode) has no DocumentProviders.")
        }
        return documentType
    }
    
    /// Event called once the document choose country button was tapped
    ///
    /// - Parameter documentChooserViewController: view controller used to select documents and countries
    @objc open func didTapChooseCountry(documentChooserViewController: MBDocumentChooserViewController) {
        let countryTableViewController = MBCountryTableViewController.initFromStoryboard(delegate: documentChooserViewController, onDismissAction: { [weak self] in
            self?.blinkIDUI?.resumeScanning()
        })
        
        countryTableViewController.modalPresentationCapturesStatusBarAppearance = true
        countryTableViewController.modalPresentationStyle = .overFullScreen
        documentChooserViewController.present(countryTableViewController, animated: true, completion: {
            self.blinkIDUI?.pauseScanning()
        })
    }
    
}
