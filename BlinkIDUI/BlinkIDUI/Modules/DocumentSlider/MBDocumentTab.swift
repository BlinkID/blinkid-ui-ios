//
//  MBDocumentTab.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 13/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit

protocol MBDocumentTabDelegate: AnyObject {
    func didTapDocumentTab(sender: MBDocumentTab)
}

class MBDocumentTab: UIView, MBNibLoadable {

    weak var delegate: MBDocumentTabDelegate?

    // MARK: - Outlet -

    @IBOutlet private weak var _textLabel: UILabel!

    var isSelected: Bool! {
        didSet {
            _textLabel.textColor = isSelected ? UIColor.mb_primaryColor : UIColor.mb_secondaryColor.withAlphaComponent(0.8)
            _textLabel.font = isSelected ? UIFont.mb_documentChooserSelectedButtonFont : UIFont.mb_documentChooserButtonFont
            layoutIfNeeded()
        }
    }

    // MARK: - Intitializers -

    static func loadFromNib() -> MBDocumentTab {
        guard let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? MBDocumentTab else { fatalError() }
        return view
    }

    // MARK: - Lifecycle -

    override func awakeFromNib() {
        super.awakeFromNib()
        _setupCell()
    }

    private func _setupCell() {
        backgroundColor = UIColor.clear
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(_didTapDocumentTab))
        self.addGestureRecognizer(touchGesture)
    }

    // MARK: - Public -

    func configure(model: MBDocumentType) {
        isSelected = false
        _textLabel.text = model.localized
    }

    // MARK: - Action -

    @objc private func _didTapDocumentTab() {
        isSelected = true
        delegate?.didTapDocumentTab(sender: self)
    }
}
