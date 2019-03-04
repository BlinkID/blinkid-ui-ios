//
//  Bundle.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 22/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

extension Bundle {
    static let frameworkBundle = Bundle(for: MBBlinkSettings.self)

    static let nonLocalizableStringTable = "NonLocalizable"
    
    static let uiStringTable = "BlinkIDUI"

    static let fieldsStringTable = "BlinkIDUIFields"

    func localizedString(_ key: String, _ table: String = fieldsStringTable) -> String {
        return self.localizedString(forKey: key, value: nil, table: table)
    }

}
