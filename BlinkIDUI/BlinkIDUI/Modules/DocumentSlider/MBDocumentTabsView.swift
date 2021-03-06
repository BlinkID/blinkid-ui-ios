//
//  MBDocumentTabCollection.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 14/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit

protocol MBDocumentTabViewDelegate: AnyObject {
    func didSelect(document: MBDocumentType)
}

class MBDocumentTabsView: UIView, MBNibLoadable {

    weak var delegate: MBDocumentTabViewDelegate?

    var documents: [MBDocumentType]? {
        didSet {
            let viewsToRemove = _stackView.subviews
            documentTabs.removeAll()
            for view in viewsToRemove {
                view.removeFromSuperview()
            }

            guard let documents = documents else { return }

            let startView = UIView(frame: CGRect.zero)
            _stackView.addArrangedSubview(startView)
            for document in documents {
                let documentTab = MBDocumentTab.loadFromNib()
                documentTabs.append(documentTab)
                documentTab.delegate = self
                documentTab.configure(model: document)
                _stackView.addArrangedSubview(documentTab)
            }
            let endView = UIView(frame: CGRect.zero)
            _stackView.addArrangedSubview(endView)

        }
    }

    private var documentTabs = [MBDocumentTab]()

    // MARK: - Outlets -

    @IBOutlet private weak var _scrollView: UIScrollView! {
        didSet {
            _scrollView.backgroundColor = UIColor.mb_shadowColor.withAlphaComponent(0.6)
        }
    }
    @IBOutlet private weak var _stackView: UIStackView!

    // MARK: - Initializers -

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }

    // MARK: - Public -

    func select(documentAtIndex index: Int) {
        for (i, documentTab) in documentTabs.enumerated() {
            documentTab.isSelected = i == index
        }
    }

    func select(document documentType: MBDocumentType) {
        for (i, documentTab) in documentTabs.enumerated() {
            if let document = documents?[i] {
                documentTab.isSelected = document == documentType
                if document == documentType {
                    // Scroll delayed for 0.2 to scroll to right document after switching countries
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.scroll(tabFrame: documentTab.frame)
                    }
                }
            } else {
                documentTab.isSelected = false
            }
        }
    }

    func scroll(tabFrame: CGRect) {
        if _scrollView.contentSize.width > _scrollView.frame.size.width {
            let offset = _scrollView.contentSize.width > frame.width ?  min(_scrollView.contentSize.width - frame.width, max(0, tabFrame.origin.x - (frame.width - tabFrame.width) / 2.0)) : 0

            UIView.animate(withDuration: MBConstants.Animation.DocumentTabsView.scrollToTabAnimationTime) {
                self._scrollView.contentOffset = CGPoint(x: offset, y: 0)
            }
        }
    }

}

// MARK: - MBDocumentTabDelegate -

extension MBDocumentTabsView: MBDocumentTabDelegate {
    func didTapDocumentTab(sender: MBDocumentTab) {
        guard
            let index = documentTabs.firstIndex(of: sender),
            let button = documents?[index] else { return }
        select(documentAtIndex: index)
        scroll(tabFrame: sender.frame)
        delegate?.didSelect(document: button)
    }
}
