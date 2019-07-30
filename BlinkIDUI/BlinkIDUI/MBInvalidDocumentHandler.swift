//
//  MBInvalidDocumentHandler.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 28/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

/// Used for two sided documents that can be validated by matching front and back side data
@objc public protocol MBInvalidDocumentHandler: AnyObject {
    
    @objc var blinkIDUI: MBBlinkIDUI? { get set }
    
    /// Needed to present alert view controller if the document isn't valid.
    @objc var overlayViewController: MBBlinkIdUiOverlayViewController? { get set }
    
    /// Called once if the scanned document is invalid and shouldValidateDocuments is set to true
    @objc func onInvalidDocumentScanned()

}

/// Alert contorller will be presented with a mesage that the front and back side data does not match
/// if scanning two sided documents is enabled and the document recognizer is either a combined recognizer, or it's recognizers can be matched using MBResultValidator.
@objc public class MBDefaultInvalidDocumentHandler: NSObject, MBInvalidDocumentHandler {
    
    @objc public weak var blinkIDUI: MBBlinkIDUI?
    
    /// Needed to present alert view controller if the document isn't valid.
    @objc public weak var overlayViewController: MBBlinkIdUiOverlayViewController?

    /// Called once if the scanned document is invalid and shouldValidateDocuments is set to true
    @objc public func onInvalidDocumentScanned() {
        let alertController = _createAlertController()
        overlayViewController?.present(alertController, animated: true, completion: {
            self.blinkIDUI?.pauseScanning()
        })
    }

    @objc public func _createAlertController() -> UIAlertController {
        let languageSettings = MBBlinkSettings.sharedInstance.languageSettings
        
        let alertController = UIAlertController(title: languageSettings.invalidDocumentAlertTitleText, message: languageSettings.invalidDocumentAlertMessageText, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.mb_primaryColor
        
        let okButton = UIAlertAction(title: languageSettings.okActionText, style: .cancel) { _ in
            alertController.dismiss(animated: true, completion: nil)
            self.blinkIDUI?.restartScanning()
            self.blinkIDUI?.resumeScanning()
        }
        
        alertController.addAction(okButton)
        
        alertController.preferredAction = okButton
        return alertController
    }
}
