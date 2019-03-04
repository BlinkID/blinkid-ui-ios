//
//  MBBlinkSettings.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 12/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation
import MicroBlink

/// `MBBlinkSettings` is a singleton containing general setting of `MBBlinkIDUI`
/// Contains almost all the customization options available without changing the framework
/// If you want to change the color or fonts see `MBTheme.swift` file.
/// - Warning: Make sure to setup your settings before creating an instance of `MBBlinkIDUI`.
@objc public class MBBlinkSettings: NSObject {

    /// Shared instance
    @objc public static let sharedInstance = MBBlinkSettings()

    private override init() {
        super.init()
    }
    
    // MARK: Scanning settings

    /// Initial country that will be selected for scanning once the scanning is started.
    /// - Default: Country of the phone.
    @objc public var initialCountry = MBCountry()
    /// Initial document that will be selected for scanning once the scanning is started.
    /// - Default: ID document.
    /// - Warning: Be careful to set the document that is supported by the initial country.
    @objc public var initialDocument = MBDocumentType.identityCard

    /// Frame grabber mode:
    /// - nothing: no frames will be returned.
    /// - successFrames: success frames will be returned through delegate methods set on MBBlinkIDUI class.
    /// - allFrames: success frames will be returned like when `success` is set, and the frames used for scanning through MBFrameGrabberDelegate.
    /// - Note: for allFrames you must implement and set frameGrabberdelegate
    /// - Default: .nothing
    @objc public var frameGrabberMode: MBFrameGrabberMode = .nothing
    
    /// If frameGrabberMode is set to allFrames, graber delegate must be provided othervise it mode will rever back to .successFrames
    @objc public weak var frameGrabberDelegate: MBFrameGrabberRecognizerDelegate?

    /// If documents have two sides, both sides will be scanned, otherwise any of the scanning of any of the sides will return results.
    /// - Default: true.
    @objc public var shouldScanBothDocumentSides: Bool = true

    /// If documents have two sides, some of them can be validated by checking the values are matching on both sides.
    /// - Default: true.
    @objc public var shouldValidateDocuments: Bool = true

    // MARK: UX settings

    /// If UI should display button to turn on/off the torch.
    /// - Default: true.
    @objc public var shouldDisplayTorchButton: Bool = true

    /// If scan sound should be played when document is scanned.
    /// - Default: true.
    @objc public var shouldPlayScanSound: Bool = true

    /// If scan torch button should be displayed.
    /// - Default: true.
    @objc public var shouldShowTorchButton: Bool = true
    
    /// If cancel button should be displayed.
    /// - Default: true.
    @objc public var shouldShowCancelButton: Bool = true
    
    /// Settings related to document and country selection process.
    /// - Default: MBDefaultDocumentChooserSettings.
    @objc public var documentChooserSettings: MBDocumentChooserSettings = MBDefaultDocumentChooserSettings()

    /// Settings related to scanning timeout events.
    /// - Default: MBDefaultTimeoutHandler.
    @objc public var timeoutHandler: MBTimeoutHandler = MBDefaultTimeoutHandler()
    
    /// Settings related to scanning invalid two sided documents.
    /// Will be used if shouldValidateDocuments property is set to true.
    /// - Default: MBDefaultInvalidDocumentHandler.
    @objc public var invalidDocumentHandler: MBInvalidDocumentHandler = MBDefaultInvalidDocumentHandler()

    /// Settings related to UI texts.
    /// - Default: Localization from BlinkIDUI.strings in Resources folder.
    @objc public let languageSettings = MBBlinkLanguageSettings()
}

// MARK: - Localization Properties -

/// Container class that has all the properties that define the text being presented to the user through UI components.
/// By default all the strings are read from the `BlinkIDUI.strings` file shipped with framework
@objc public class MBBlinkLanguageSettings: NSObject {

    // MARK: - UI Text -

    /// Message shown if glare is detected.
    /// - Default: "Glare detected. Slightly move the card."
    @objc public var glareMessageText = Bundle.frameworkBundle.localizedString("glareMessage", Bundle.uiStringTable)

    /// Message shown if any side of document is scanned.
    /// - Default: "Scan the the selected document or choose another."
    @objc public var scanAnySideMessageText = Bundle.frameworkBundle.localizedString("scanAnyMessage", Bundle.uiStringTable)

    /// Message shown if front side of document is scanned.
    /// - Default: "Scan the front side of the selected document or choose another."
    @objc public var scanFrontSideMessageText = Bundle.frameworkBundle.localizedString("scanFrontMessage", Bundle.uiStringTable)

    /// Message shown if back side of document is scanned.
    /// - Default: "Scan the back side."
    @objc public var scanBackSideMessageText = Bundle.frameworkBundle.localizedString("scanBackMessage", Bundle.uiStringTable)

    /// Title of country selection view controller.
    /// - Default: "Select Country"
    @objc public var selectCountryTitleText = Bundle.frameworkBundle.localizedString("selectCountry", Bundle.uiStringTable)

    /// Close button text in country selection view controller.
    /// - Default: "Close"
    @objc public var closeText = Bundle.frameworkBundle.localizedString("close", Bundle.uiStringTable)

    /// Search placeholder text in country selection view controller.
    /// - Default: "Search"
    @objc public var searchPlaceholderText = Bundle.frameworkBundle.localizedString("search", Bundle.uiStringTable)

    /// Note in country chooser button.
    /// - Default: "Choose from more than 100 countries"
    @objc public var countryChooserButtonText = Bundle.frameworkBundle.localizedString("countryNote", Bundle.uiStringTable)
    
    /// Change country text of the action in timeout alert controller.
    /// - Default: "Change country"
    @objc public var changeCountryActionText = Bundle.frameworkBundle.localizedString("changeCountry", Bundle.uiStringTable)
    
    /// Continue text of the action in timeout alert controller.
    /// - Default: "Continue"
    @objc public var continueActionText = Bundle.frameworkBundle.localizedString("continue", Bundle.uiStringTable)
    
    /// Title of timeout alert controller.
    /// - Default: "Having trouble scanning?"
    @objc public var timeoutAlertTitleText = Bundle.frameworkBundle.localizedString("timeoutTitle", Bundle.uiStringTable)
    
    /// Message of timeout alert controller.
    /// - Default: "Make sure you have good lightning and that you've selected the correct document."
    @objc public var timeoutAlertMessageText = Bundle.frameworkBundle.localizedString("timeoutMessage", Bundle.uiStringTable)
    
    /// Message of invalid document alert controller.
    /// - Default: "Front and back side do not match. Please try again."
    @objc public var invalidDocumentAlertMessageText = Bundle.frameworkBundle.localizedString("invalidDocumentMessage", Bundle.uiStringTable)
    
    /// Title of invalid document alert controller.
    /// - Default: "Having trouble scanning?"
    @objc public var invalidDocumentAlertTitleText = Bundle.frameworkBundle.localizedString("invalidDocumentTitle", Bundle.uiStringTable)
    
    /// OK text of the action in invalid document alert.
    /// - Default: "OK"
    @objc public var okActionText = Bundle.frameworkBundle.localizedString("ok", Bundle.uiStringTable)
    
    // MARK: - Document Type Text -

    /// Text for identity cards in document tabs view.
    /// - Default: "ID card"
    @objc public var identityCardText = Bundle.frameworkBundle.localizedString("identityCard", Bundle.uiStringTable)

    /// Text for driver's license cards in document tabs view.
    /// - Default: "Driver's License"
    @objc public var driversLicenseText = Bundle.frameworkBundle.localizedString("driversLicense", Bundle.uiStringTable)

    /// Text for visas in document tabs view.
    /// - Default: "Visa"
    @objc public var visaText = Bundle.frameworkBundle.localizedString("visa", Bundle.uiStringTable)

    /// Text for old identity cards in document tabs view.
    /// This is specific to some countries, i.e. Germany
    /// - Default: "Old ID card"
    @objc public var oldIDCardText = Bundle.frameworkBundle.localizedString("oldIDCard", Bundle.uiStringTable)

    /// Text for new identity cards in document tabs view.
    /// This is specific to some countries, i.e. United Arab Emirates
    /// - Default: "New ID card"
    @objc public var newIDCardText = Bundle.frameworkBundle.localizedString("newIDCard", Bundle.uiStringTable)
    
    /// Text for malaysian identity cards in document tabs view.
    /// This is specific to Malaysia
    /// - Default: "MyKad"
    @objc public var malaysianIDCardText = Bundle.frameworkBundle.localizedString("malaysianIDCard", Bundle.nonLocalizableStringTable)
    
    /// Text for military identity cards in document tabs view.
    /// This is specific to Malaysia
    /// - Default: "MyTentera"
    @objc public var militaryIDCardText = Bundle.frameworkBundle.localizedString("militaryIDCard", Bundle.nonLocalizableStringTable)
    
    /// Text for permanent resident identity cards in document tabs view.
    /// This is specific to Malaysia
    /// - Default: "MyPr"
    @objc public var permanentResidentIDCardText = Bundle.frameworkBundle.localizedString("permanentResidenceIDCard", Bundle.nonLocalizableStringTable)
    
    /// Text for  temporary resident identity cards in document tabs view.
    /// This is specific to Malaysia
    /// - Default: "MyKas"
    @objc public var temporaryResidentIDCardText = Bundle.frameworkBundle.localizedString("temporaryResidenceIDCard", Bundle.nonLocalizableStringTable)
    
    /// Text for immigrator identity cards in document tabs view.
    /// This is specific to Malaysia
    /// - Default: "iKad"
    @objc public var immigratorIDCardText = Bundle.frameworkBundle.localizedString("immigratorIDCard", Bundle.nonLocalizableStringTable)

    /// Text for passports in document tabs view.
    /// - Default: "Passport"
    @objc public var passportText = Bundle.frameworkBundle.localizedString("passport", Bundle.uiStringTable)

    /// Text for temporary residence permits in document tabs view.
    /// - Default: "Temporary Residence Permit"
    @objc public var temporaryResidencePermitText = Bundle.frameworkBundle.localizedString("temporaryResidencePermitText", Bundle.uiStringTable)
    
    /// Text for residence permits in document tabs view.
    /// - Default: "Residence Permit"
    @objc public var residencePermitText = Bundle.frameworkBundle.localizedString("residencePermit", Bundle.uiStringTable)
}
