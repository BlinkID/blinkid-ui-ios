//
//  ViewController.swift
//  BlinkID-UI-Sample-Swift
//
//  Created by Jure Čular on 12/12/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit
import MicroBlink
import BlinkIDUI

class ViewController: UIViewController {

    lazy var blinkIdUI = MBBlinkIDUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MBMicroblinkSDK.sharedInstance().setLicenseResource("blinkid-license", withExtension: "txt", inSubdirectory: nil, for: Bundle.main)
        setupBlinkIDUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(blinkIdUI.recognizerRunnerViewController, animated: false, completion: nil)
    }
    
    func setupBlinkIDUI() {
        MBBlinkSettings.sharedInstance.frameGrabberMode = .nothing
        MBBlinkSettings.sharedInstance.initialCountry = MBCountry(supportedCountry: .unitedStatesOfAmerica)
        MBBlinkSettings.sharedInstance.initialDocument = .driverLicense
        
        MBBlinkSettings.sharedInstance.shouldShowCancelButton = false
        MBBlinkSettings.sharedInstance.shouldValidateDocuments = true
        // Change the colors
        // UIColor.mb_primaryColor = .red
        // UIColor.mb_secondaryColor = .black
        // UIColor.mb_tertiaryColor = .white
        // UIColor.mb_shadowColor = .white
        
        blinkIdUI.delegate = self
    }
}

extension ViewController: MBBlinkDelegate {
    func didScanEntireDocument(recognitionResult: MBRecognitionResult, successFrame: UIImage?) {
        blinkIdUI.pauseScanning()
        let alertController = UIAlertController(title: recognitionResult.resultTitle, message: recognitionResult.resultEntries.description, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.blinkIdUI.resumeScanning()
            self.blinkIdUI.restartScanning()
        }
        alertController.addAction(okAction)
        blinkIdUI.recognizerRunnerViewController.present(alertController, animated: true, completion: nil)
    }
    
    func didScanFirstSide(recognitionResult: MBRecognitionResult, successFrame: UIImage?) {
    }
}

