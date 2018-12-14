//
//  MBTheme.swift
//  MicroBlinkUI
//
//  Created by Dino Gustin on 12/09/2018.
//  Copyright © 2018 Dino Gustin. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Primary color used for text and various UI elements
    @objc public static var mb_primaryColor = colorInSRGBWithInteger(red: 72, green: 178, blue: 232, alpha: 1)

    /// Secondary color used for text and various UI elements
    @objc public static var mb_secondaryColor = colorInSRGBWithInteger(red: 255, green: 255, blue: 255, alpha: 1)

    /// Tertiary color used for text and various UI elements
    @objc public static var mb_tertiaryColor = colorInSRGBWithInteger(red: 0, green: 0, blue: 0, alpha: 1)

    /// Shadow color used for various UI elements
    @objc public static var mb_shadowColor = colorInSRGBWithInteger(red: 0, green: 0, blue: 0, alpha: 1)

    static func colorInSRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        guard let sRGBColorSpace = CGColorSpace(name: CGColorSpace.sRGB) else {
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }

        let components = [red, green, blue, alpha]

        guard let cgColor = CGColor(colorSpace: sRGBColorSpace, components: components) else {
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }

        return UIColor(cgColor: cgColor)
    }

    static func colorInSRGBWithInteger(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor.colorInSRGB(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

}

extension UIFont {
    
    /// Font used for the document that is selected in document tabs view
    @objc public static var mb_documentChooserSelectedButtonFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)

    /// Font used for the documents that aren't selected in document tabs view
    @objc public static var mb_documentChooserButtonFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)

    /// Font used for message(glare detected, scan front, back or any side) label displayed on the overlay
    @objc public static var mb_messageLabelFont = UIFont.systemFont(ofSize: 16.0, weight: .bold)

    /// Font used for label that shows what country is chosen
    @objc public static var mb_chosenCountryLabelFont = UIFont.systemFont(ofSize: 17.0, weight: .bold)

    /// Font used for label that shows the note above chosen country
    @objc public static var mb_countryButtonNoteLabelFont = UIFont.systemFont(ofSize: 12.0, weight: .medium)
    
    /// Font used for labels of countries in CountryTableViewController
    @objc public static var mb_countryCellLabelFont = UIFont.systemFont(ofSize: 17.0, weight: .regular)
}
