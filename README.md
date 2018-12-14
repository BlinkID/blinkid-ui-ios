<p align="center" >
  <img src="https://raw.githubusercontent.com/wiki/blinkid/blinkid-ios/Images/logo-microblink.png" alt="MicroBlink" title="MicroBlink">
</p>

# BlinkID UI for iOS
BlinkID UI is a framework that lets you scan any BlinkID supported document without even knowing what a `Recognizer` is.

It includes a customizable scan view controller and country table view controller.

See our [demo app](https://itunes.apple.com/us/app/blinkid/id1258136557?mt=8).

New to _BlinkID_? Check out [BlinkID SDK](https://github.com/BlinkID/blinkid-ios) first.

## Table of Contents

- [Dependencies](#dependencies)
- [Getting BlinkID UI](#getting-blinkid-ui)
- [Quick Start](#quick-start)
    - [Reading results](#reading-results)
    - [Swift example](#minimal-swift-example)
    - [Objective-C example](#minimal-objective-c-example)
- [Reporting Issues](#reporting-issues)
- [Feature requests](#feature-requests)
- [FAQ](#faq)
- [Troubleshooting](#troubleshooting)
- [Documentation](https://blinkid.github.io/blinkid-ui-ios/)

# Dependencies

BlinkID UI depends on _BlinkID_ SDK. Since _BlinkID_ uses `git-lfs` you will need to install it to clone/install BlinkID UI through **Cocoapods**.
Easiest way to install [git-lfs](https://git-lfs.github.com) is using [brew](https://brew.sh):
```
brew install git-lfs
git lfs install
```

# Getting BlinkID UI
1. **Install git-lfs**
2.  Clone this repo: `https://github.com/BlinkID/blinkid-ui-ios.git`
3.  Since _BlinkID_ is included as a submodule you'll need to run:
```
git submodule init
git submodule update
```
4. Check out the samples or follow the **Quick Start** guide to start using it in your project.

# Quick Start
_BlinkID UI_ is a **Swift** framework, but we are also supporting **Objective-C**.

This framework depends on _BlinkID SDK_ so you'll need to add the _BlinkID_ framework to your embedded frameworks of your Xcode project.
You can do this by dragging **Microblink.framework** and **Microblink.bundle** from **blinkid-ios** submodule into your project included in this repository. 

Make sure **Microblink.framework** is added to the embedded frameworks in your target and **Microblink.bundle** is included in your **Copy bundle resources** build phase.

Now drag **BlinkIDUI.xcodeproj** to your project explorer. In the project navigator find **Products** in **BlinkIDUI** project and drag the **BlinkIDUI.framework** to your embedded frameworks in your target.

After adding the framework to your project, you will need to do the following:
* First make sure that you correctly configured Microblink license. Check [BlinkID documentation](https://github.com/BlinkID/blinkid-ios/blob/master/README.md) for more info.
* Implement the `MBBlinkDelegate` protocol.
* *Optional* setup properties you want using `MBBlinkSettings` singleton.
* *Optional* setup `UIColor` and `UIFont` properties using extensions in `MBTheme`.
* Create an `MBBlinkIDUI` instance
    * Remember to hold a reference to `MBBlinkIDUI` instance.
    * Set its `MBBlinkDelegate` property.
    * Use its `recognizerRunnerViewController` property and `present` it.

If you want to customise scanning behavior and UI take a look at [FAQ](#faq).
We tried to make this framework easily customizable, but still simple enough to be used out of the box.

## Reading results
The `MBRecognitionResult` class contains scanning results.
The class contains the `resultTitle` which is usually a combination of the first name, and the last name read from the document.

Property `resultEntries` contains an array of `MBField`s, these are the results read from the document. Inside `MBField` you will find the result value and an `MBFieldKey` that describes it.

Images that can be returned are `frontSideDocumentImage` if a two-sided or a one-sided document is scanned; and `backSideDocumentImage` if a two-sided document is scanned.


A `faceImage` will be returned if the used recognizer supports face image extractions and if the document contains a face image. The same principle applies to the `signatureImage`.

## Minimal Swift Example
```Swift
import UIKit
import BlinkIDUI
import MicroBlink

class ViewConroller: UIViewController {
    lazy var blinkIdUI: MBBlinkIDUI = MBBlinkIDUI()

     override func viewDidLoad() {
        super.viewDidLoad()
        MBMicroblinkSDK.sharedInstance().setLicenseKey("License-Key")
    }

    @IBAction func scan(_ sender: Any) {
        // You can set any settings for BlinkIDUI though MBBlinkSettings.sharedInstance:
        MBBlinkSettings.sharedInstance.frameGrabberMode = .nothing
        MBBlinkSettings.sharedInstance.shouldPlayScanSound = false

        blinkIdUI.delegate = self
        
        let recognizerRunnerViewController = blinkIdUI.recognizerRunnerViewController
        present(recognizerRunnerViewController, animated: true, completion: nil)
    }
}

extension ViewController: MBBlinkDelegate {
    
    func didStartScanning() {
        // When scanning starts you will be notified through this method
    }
    
    func didScanEntireDocument(recognitionResult: MBRecognitionResult, successFrame: UIImage?) {
        blinkIdUI.pauseScanning()

        // Use recognition Result to present them to the user
        // After presenting you can finish the scanning by dismissing:
        // blinkIdUI.recognizerRunnerViewController.dismiss(animated: true, completion: nil)
        // or you can resumeScanning and restart it:

        blinkIdUI.resumeScanning()
        blinkIdUI.restartScanning()
    }
    
    func didScanFirstSide(recognitionResult: MBRecognitionResult, successFrame: UIImage?) {
        // If a document has two sides and if two separate recognizers are used 
        // this method will be called when the first side is scanned
    }
    
    func didChangeDocument(newDocument: MBDocumentProvider) {
        // When a user changes the document you will be notified through this method
    }
    
    func didTapCancelButton() {
        // You can set here what happens once the user taps the `X` button on the UI.
        blinkIdUI.recognizerRunnerViewController.dismiss(animated: true, completion: nil)
    }
}
```

## Minimal Objective-C example

### ViewController.h
```Objc
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@end
```
### ViewController.m
```Objc
#import "ViewController.h"
#import <MicroBlink/MicroBlink.h>
#import <BlinkIDUI/BlinkIDUI-Swift.h>

@interface ViewController ()<MBBlinkDelegate>

@property MBBlinkIDUI *blinkIDUI;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[MBMicroblinkSDK sharedInstance] setLicenseKey:@"License-Key"];
}

- (IBAction)scan:(id)sender {
    // You can set any settings for BlinkIDUI though MBBlinkSettings.sharedInstance:
    MBBlinkSettings.sharedInstance.frameGrabberMode = MBFrameGrabberModeNothing;
    MBBlinkSettings.sharedInstance.shouldPlayScanSound = NO;
    
    self.blinkIDUI = [[MBBlinkIDUI alloc] init];
    self.blinkIDUI.delegate = self;
    
    [self presentViewController:self.blinkIDUI.recognizerRunnerViewController animated:YES completion:nil];
}

- (void)didChangeDocumentWithNewDocument:(MBDocumentProvider * _Nonnull)newDocument {
    // When a user changes the document you will be notified through this method
}

- (void)didScanEntireDocumentWithRecognitionResult:(MBRecognitionResult * _Nonnull)recognitionResult successFrame:(UIImage * _Nullable)successFrame {
    [self.blinkIDUI pauseScanning];
    // Use recognition Result to present them to the user
    // After presenting you can finish the scanning by dismissing:
    // [self.blinkIDUI.recognizerRunnerViewController dismissViewControllerAnimated:YES completion:nil];
    // or you can resumeScanning and restart it:
    
    
    [self.blinkIDUI resumeScanning];
    [self.blinkIDUI restartScanning];
}

- (void)didScanFirstSideWithRecognitionResult:(MBRecognitionResult * _Nonnull)recognitionResult successFrame:(UIImage * _Nullable)successFrame {
    // If a document has two sides and two separate recognizers are used
    // this method will be called when the first side is scanned
}

- (void)didStartScanning {
    // You will be notified once the scanning starts through this method
}

- (void)didTapCancelButton {
    [self.blinkIDUI.recognizerRunnerViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
```

# Reporting Issues
If you find any issues open an issue here on GitHub, but please specify as much information as you can.
Please specify:
 * How did you add the framework to your project, Cocoapods/Manual.
 * Xcode version.
 * Swift or Objective-C.
 * iOS device and iOS version used to run.
 * **Sample which we can use to reproduce the issue.**
You can also contact us at [help.microblink.com](https://help.microblink.com/hc/en-us).

# Feature requests
If you have any feature requests, you can open an issue, or you can implement it and make a pull request.
Please note that we try to keep the API similar to the the [Android version](https://github.com/BlinkID/blinkid-ui-android) of the framework.

## Pull requests
When making pull requests specify the issue/feature your pull request solves/adds.
If it's a feature, add an example of why you need this feature. Otherwise, we might reject your pull request.

# FAQ
## How do I customize colors and fonts?
Check out `MBTheme` file; it contains extensions of `UIColor` and `UIFont`.
The color palette is split in 3 colors, primary, secondary, tertiary and there's also a shadow color which is separate from the palette.
Every text shown on the UI has its font defined here, you can set the font properties and change the font on the UI.

## How do I disable scan sound?
Using `MBBlinkSettings` shared instance you can set various scanning properties.
To turn off sound after a successful scan, set `shouldPlayScanSound` to **false**

## How do I limit selection to specific countries and document types?
Use `MBDocumentChooserSettings` for the following:
* Use `countryFilter` to filter countries you want/don't want users to pick in country table view controller.
* Use `shouldShowDocumentTypeTabs` to show/hide the controller for choosing documents.
* Use `shouldShowCountryChooser` to show/hide the button that opens country table view controller.
* Use `sectionIndexMinimumDisplayRowCount` to set minimum number of rows to show index sidebar in country table view controller.
* Use `isDocument(document: MBDocumentType, supportedForCountry country: MBCountry) -> Bool` to show/hide documents from certain countries. i.e. If you don't want the user to be able to scan/pick _Croatian ID_ this method would return `false` if `countryCode` of `country` instance is `MBSupportedCountry.croatia` and document is `MBDocumentType.identityCard`.
* Use `defaultDocumentTypeForCountry(country: MBCountry) -> MBDocumentType` to set the first document type to scan for the given country.
* Use `didTapChooseCountry(documentChooserViewController: MBDocumentChooserViewController)` to set what happens when user taps choose country button.

## How can I get scan only one side of the document?
In `MBBlinkSettings` shared instance set the `shouldScanBothDocumentSides` to **false**, this way scanning any side of the two-sided document will return a result.

## How can I hide torch button?
In `MBBlinkSettings` shared instance set the `shouldShowTorchButton` to **false**.

## How can I hide `X` button?
In `MBBlinkSettings` shared instance set the `shouldShowCancelButton` to **false**.

## How can I change/remove `Having trouble scanning` Alert?
Implement your own `MBTimeoutHandler` and set the property `timeoutHandler` in `MBBlinkSettings` shared instance.

## How can I change document validation?
You can turn off document validation by setting `shouldValidateDocuments` in `MBBlinkSettings` to **false**
If the `shouldValidateDocuments` is set to **true**, you can change the default behaviour when document is not validated by
implementing `MBInvalidDocumentHandler` and setting the `invalidDocumentHandler` in `MBBlinkSettings` shared instance.
Implement your own `MBTimeoutHandler` and set the property `timeoutHandler` in `MBBlinkSettings` shared instance.

## How can I get success frames?
In `MBBlinkSettings` set the `frameGrabberMode` to _success_ or _allFrames_, if you want to receive all frames you will need to provide `MBFrameGrabberDelegate` by setting `frameGrabberDelegate` property in `MBBlinkSettings` shared instance.

## How can I set my own text for labels and buttons?
In `MBBlinkSettings` shared instance, you can find `MBBlinkLanguageSettings` property. You can set various text properties, by default text is used from `.strings` file provided through the framework.

## Where do I get the license for my project?
[Register](https://microblink.com) at our site and you can get a _BlinkID_ demo license key from the developer dashboard. 

# Troubleshooting
## Getting the following error:
```
ignoring file .../PPBlinkID/MicroBlink.framework/MicroBlink, file was built for unsupported file format ( 0x76 0x65 0x72 0x73 0x69 0x6F 0x6E 0x20 0x68 0x74 0x74 0x70 0x73 0x3A 0x2F 0x2F ) which is not the architecture being linked (x86_64)MicroBlink.framework/MicroBlink
```
Most probable cause of this issue is missing **git-lfs**, or installing it after cloning the repository.
Simply install git-lfs, follow the [instructions](#dependencies) and run `git-lfs pull` . 

If you've installed the framework using **Cocoapods** run:
```
pod cache clean
pod install
```
You need to clean the **Cocoapods** _cache_ because it cloned the repository without **git-lfs**.