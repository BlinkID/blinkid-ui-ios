//
//  ViewController.m
//  BlinkID-UI-Sample-ObjC
//
//  Created by Jure Čular on 12/12/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

#import "ViewController.h"
#import <MicroBlink/MicroBlink.h>
#import <BlinkIDUI/BlinkIDUI.h>

@interface ViewController () <MBBlinkDelegate>

@property (nonatomic, nonnull) MBBlinkIDUI *blinkIdUI;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[MBMicroblinkSDK sharedInstance] setLicenseResource:@"blinkid-license" withExtension:@"txt" inSubdirectory:nil forBundle:NSBundle.mainBundle];
    [self setupBlinkIDUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self presentViewController:self.blinkIdUI.recognizerRunnerViewController animated:YES completion:nil];
}

- (void)setupBlinkIDUI {
    MBBlinkSettings.sharedInstance.frameGrabberMode = MBFrameGrabberModeNothing;
    MBBlinkSettings.sharedInstance.initialCountry = [[MBCountry alloc] initWithSupportedCountry:MBSupportedCountryUnitedStatesOfAmerica];
    MBBlinkSettings.sharedInstance.initialDocument = MBDocumentTypeDriverLicense;
    
    MBBlinkSettings.sharedInstance.shouldShowCancelButton = NO;
    
    // Change the colors
     UIColor.mb_primaryColor = UIColor.redColor;
     UIColor.mb_secondaryColor = UIColor.blackColor;
     UIColor.mb_tertiaryColor = UIColor.whiteColor;
     UIColor.mb_shadowColor = UIColor.whiteColor;
    
    self.blinkIdUI = [[MBBlinkIDUI alloc] init];
    self.blinkIdUI.delegate = self;
}

// MARK: - MBBlinkDelegate -

- (void)didScanEntireDocumentWithRecognitionResult:(MBRecognitionResult * _Nonnull)recognitionResult successFrame:(UIImage * _Nullable)successFrame {
    [self.blinkIdUI pauseScanning];
    
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:recognitionResult.resultTitle message:recognitionResult.resultEntries.description preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.blinkIdUI resumeScanning];
        [self.blinkIdUI restartScanning];
    }];
    
    [alerController addAction:okAction];
    
    [self.blinkIdUI.recognizerRunnerViewController presentViewController:alerController animated:YES completion:nil];
}

- (void)didScanFirstSideWithRecognitionResult:(MBRecognitionResult * _Nonnull)recognitionResult successFrame:(UIImage * _Nullable)successFrame {
}

- (void)didTapCancelButton {
    
}

- (void)didChangeDocumentWithNewDocument:(MBDocumentProvider *)newDocument forCountry:(MBCountry *)country {
    
}

- (void)didStartScanningWithState:(enum MBScanState)state {
    
}

@end
