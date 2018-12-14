//
//  Localizable.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 08/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

/// Protocol used to define the localizable values of various models
/// present through the framework.
public protocol MBLocalizable {
    /// Property that defines the text which can be presented to the user.
    var localized: String { get }
}

extension MBLocalizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        return Bundle.frameworkBundle.localizedString(self.rawValue)
    }
}
