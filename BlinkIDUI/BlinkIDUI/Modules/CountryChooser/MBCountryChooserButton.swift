//
//  MBCountryPickerButton.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 09/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit

protocol MBCountryChooserDelegate: AnyObject {
    func didTapCountryPicker()
}

class MBCountryChooserButton: UIView, MBNibLoadable {

    weak var delegate: MBCountryChooserDelegate?

    // MARK: - Outlets -

    @IBOutlet private weak var _chosenCountryLabel: UILabel! {
        didSet {
            _chosenCountryLabel.textColor = UIColor.mb_tertiaryColor
            _chosenCountryLabel.font = UIFont.mb_chosenCountryLabelFont
        }
    }

    @IBOutlet private weak var _countryButtonNoteLabel: UILabel! {
        didSet {
            _countryButtonNoteLabel.textColor = UIColor.mb_tertiaryColor
            _countryButtonNoteLabel.font = UIFont.mb_countryButtonNoteLabelFont
            _countryButtonNoteLabel.text = MBBlinkSettings.sharedInstance.languageSettings.countryChooserButtonText
        }
    }
    @IBOutlet private weak var _arrowImage: UIImageView! {
        didSet {
            _arrowImage.tintColor = UIColor.mb_tertiaryColor
        }
    }

    // MARK: - Initializers -

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        _setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
        _setup()
    }

    private func _setup() {
        backgroundColor = UIColor.mb_primaryColor
    }

    // MARK: - Actions -

    @IBAction private func _tappedCountryPicker(_ sender: Any) {
        delegate?.didTapCountryPicker()
    }

    // MARK: - Public -

    func updateCountryLabel(withCountry country: MBCountry) {
        _chosenCountryLabel.text = country.localized
    }
}
