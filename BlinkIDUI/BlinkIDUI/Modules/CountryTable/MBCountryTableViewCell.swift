//
//  MBCountryTableViewCell.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 11/12/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit

class MBCountryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var _countryLabel: UILabel!

    // MARK: - Lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _setupCell()
    }
    
    func _setupCell() {
        _countryLabel.font = UIFont.mb_countryCellLabelFont
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.mb_primaryColor
        self.selectedBackgroundView = selectedBackgroundView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MBCountryTableViewCell: MBCellConfigurable {
    typealias DataType = MBCountry
    
    func configure(model: MBCountry) {
        _countryLabel.text = model.localized
    }
}
