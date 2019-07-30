//
//  MBDocumentPickerViewController.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 09/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit

protocol MBDocumentChooserViewControllerDelegate: AnyObject {
    func didSelect(document: MBDocumentType, fromCountry country: MBCountry)
}

/// `MBDocumentChooserViewController` class used to present the user with a UI flow to change the document being scanned.
/// It provides the UI to change the country and/or the document being scanned by the user.
public class MBDocumentChooserViewController: UIViewController {

    weak var delegate: MBDocumentChooserViewControllerDelegate?
    var settings: MBDocumentChooserSettings? {
        return MBBlinkSettings.sharedInstance.documentChooserSettings
    }

    // MARK: Outlets

    @IBOutlet private weak var _documentChooser: MBDocumentTabsView! {
        didSet {
            _documentChooser.delegate = self
            if let settings = settings {
                _documentChooser.isHidden = !settings.shouldShowDocumentTypeTabs
            }
        }
    }
    @IBOutlet private weak var _countryChooser: MBCountryChooserButton! {
        didSet {
            _countryChooser.delegate = self
            if let settings = settings {
                _countryChooser.isHidden = !settings.shouldShowCountryChooser
            }
        }
    }

    private var _currentCountry: MBCountry = MBBlinkSettings.sharedInstance.initialCountry
    private var _currentDocument: MBDocumentType = MBBlinkSettings.sharedInstance.initialDocument
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _countryChanged(country: _currentCountry, withDocument: _currentDocument)
    }

    private func _countryChanged(country: MBCountry, withDocument document: MBDocumentType? = nil) {
        _currentCountry = country
        _countryChooser.updateCountryLabel(withCountry: country)
        // Filter documents that are considered supported
        _documentChooser.documents = country.countryProvider.supportedDocuments.filter({ (documentType) -> Bool in
            settings?.isDocument(document: documentType, supportedForCountry: country) ?? false
        })
        _documentChanged(document: _currentDocument)
    }

    private func _documentChanged(document: MBDocumentType? = nil) {
        var availableDocument: MBDocumentType?
        // Check if given document is supported
        if let document = document,
            settings?.isDocument(document: document, supportedForCountry: _currentCountry) ?? false {
            availableDocument = document
        } else if let defaultDocument = settings?.defaultDocumentTypeForCountry(country: _currentCountry),
            settings?.isDocument(document: defaultDocument, supportedForCountry: _currentCountry) ?? false {
            // If the given document is nil or it's not supported,
            // check what is the default document for this country and if it is supported,
            // and set that document
            availableDocument = defaultDocument
        } else {
            // If all else fails select the next available one
            availableDocument = _documentChooser.documents?.first
        }

        if let availableDocument = availableDocument {
            _currentDocument = availableDocument
            _documentChooser.select(document: availableDocument)
            delegate?.didSelect(document: availableDocument, fromCountry: _currentCountry)
        }

    }

}

// MARK: - MBDocumentPickerDelegate -

extension MBDocumentChooserViewController: MBDocumentTabViewDelegate {
    func didSelect(document: MBDocumentType) {
        _currentDocument = document
        delegate?.didSelect(document: document, fromCountry: _currentCountry)
    }
}

// MARK: - MBCountryPickerDelegate -

extension MBDocumentChooserViewController: MBCountryChooserDelegate {
    func didTapCountryPicker() {
        settings?.didTapChooseCountry(documentChooserViewController: self)
    }
}

// MARK: - MBDocumentPickerViewController -

extension MBDocumentChooserViewController: MBCountryTableViewControllerDelegate {
    public func lastSelectedCountry() -> MBCountry? {
        return _currentCountry
    }

    public func didSelectCountry(country: MBCountry) {
        _countryChanged(country: country)
    }
}
