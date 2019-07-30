//
//  MBTimeoutHandler.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 28/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import Foundation

/// This protocol can be used to define how to handle various events.
/// By default it's used to capture events to stop/start timeout timer.
/// - See: `MBDefaultTimeoutHandler` to understand how this can be used
@objc public protocol MBTimeoutHandler: AnyObject {
    
    @objc var blinkIDUI: MBBlinkIDUI? { get set }
    
    /// Needed to present alert view controller once the timeout it out.
    @objc var overlayViewController: MBBlinkIdUiOverlayViewController? { get set }
    
    /// Called everytime scanning is started
    @objc func onScanStart()
    
    /// Called once the scanning is done
    @objc func onScanDone()
    
    /// Called once the scanning is paused
    @objc func onScanPaused()
    
    /// Called once the scanning is resumed
    @objc func onScanResumed()
    
}

/// `MBDefaultTimeoutHandler` is used to present the user with an `UIAlertController`
/// that notifes them that they can change the Country/Document being scanned.
/// If *timerTimeout* number of seconds pass without any successfull results this class will present
/// a `UIAlertController` with a message to user to try changing the Country.
@objc open class MBDefaultTimeoutHandler: NSObject, MBTimeoutHandler {
    
    @objc public weak var blinkIDUI: MBBlinkIDUI?
    
    /// Needed to present alert view controller once the timeout it out.
    @objc public weak var overlayViewController: MBBlinkIdUiOverlayViewController?
    
    private var _timeoutTimer: Timer?
    private var _startTimerTimeout: TimeInterval
    private var _currentTimerTimeout: TimeInterval
    
    @objc public required init(timerTimeout: TimeInterval = 16) {
        _startTimerTimeout = timerTimeout
        _currentTimerTimeout = timerTimeout
    }
    
    /// Called everytime scanning is started
    @objc open func onScanStart() {
        _destroyTimer()
        _createTimer()
    }
    
    /// Called once the scanning is done
    @objc open func onScanDone() {
        _destroyTimer()
    }
    
    /// Called once the scanning is paused
    @objc open func onScanPaused() {
        _destroyTimer()
    }
    
    /// Called once the scanning is resumed
    @objc open func onScanResumed() {
        _destroyTimer()
        _createTimer()
    }
    
    private func _destroyTimer() {
        _timeoutTimer?.invalidate()
        _timeoutTimer = nil
    }
    
    private func _createTimer() {
        _currentTimerTimeout = _startTimerTimeout
        
        _timeoutTimer?.invalidate()
        _timeoutTimer = Timer.scheduledTimer(timeInterval: _currentTimerTimeout, target: self, selector: #selector(onTimeout), userInfo: nil, repeats: false)
    }
    
    @objc open func onTimeout() {
        _destroyTimer()
        // Make sure alert controller doesn't get shown if the scanning
        guard let recognizerRunnerViewController = overlayViewController?.recognizerRunnerViewController, !recognizerRunnerViewController.isScanningPaused() else {
            return
        }
        _startTimerTimeout = 2 * _startTimerTimeout

        let alertController = _createAlertController()
        
        overlayViewController?.present(alertController, animated: true, completion: {
            self.blinkIDUI?.pauseScanning()
        })
    }
    
    private func _createAlertController() -> UIAlertController {
        let languageSettings = MBBlinkSettings.sharedInstance.languageSettings
        
        let alertController = UIAlertController(title: languageSettings.timeoutAlertTitleText, message: languageSettings.timeoutAlertMessageText, preferredStyle: .alert)
        alertController.view.tintColor = UIColor.mb_primaryColor
        
        let continueButton = UIAlertAction(title: languageSettings.continueActionText, style: .cancel) { _ in
            alertController.dismiss(animated: true, completion: nil)
            self.blinkIDUI?.resumeScanning()
        }
        
        let changeCountryButton = UIAlertAction(title: languageSettings.changeCountryActionText, style: .default) { (_) in
            self.blinkIDUI?.resumeScanning()
            if let documentChooserViewController = self.overlayViewController?.documentChooserViewController {
                MBBlinkSettings.sharedInstance.documentChooserSettings.didTapChooseCountry(documentChooserViewController: documentChooserViewController)
            }
        }
        
        alertController.addAction(continueButton)
        alertController.addAction(changeCountryButton)
        
        alertController.preferredAction = continueButton
        return alertController
    }
}
