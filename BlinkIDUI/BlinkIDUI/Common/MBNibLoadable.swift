//
//  NBLoadable.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 07/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

protocol MBNibLoadable {
    static var nibName: String { get }
}

extension MBNibLoadable where Self: UIView {

    static var bundle: Bundle {
        return Bundle(for: Self.self)
    }

    static var nibName: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }

    static var nib: UINib {
        return UINib(nibName: Self.nibName, bundle: bundle)
    }

    func setupFromNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 11.0, *) {
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        } else {
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
            view.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        }

    }
}
