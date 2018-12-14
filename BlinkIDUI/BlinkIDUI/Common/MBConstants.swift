//
//  MBConstants.swift
//  MicroBlinkUI
//
//  Created by Jure Čular on 03/10/2018.
//  Copyright © 2018 Dino Gustin. All rights reserved.
//

import CoreGraphics
import Foundation

struct MBConstants {
    struct Name {
        struct OverlayViewController {
            static let storyboard = "MBBlinkIDOverlay"

            static let blinkIdIdentifier = "MBBlinkIdOverlayViewController"
        }

        struct CountryTableViewController {
            static let storyboard = "MBDocumentSelection"

            static let countrySelectIdentifier = "MBCountrySelectNavigationViewController"
        }
    }

    struct Animation {
        struct OverlayViewController {
            static let viewfinderChangeAnimationTime: Double = 0.2

            static let documentSelectionAnimationTime: Double = 0.75
            static let messageLabelAnimationDelayTime: Double = 2.0
            static let messageLabelAnimationTime: Double = 0.25
            static var messageLabelAlphaBegin: CGFloat = 1.0
            static var messageLabelAlphaEnd: CGFloat = 0.0
        }

        struct Viewfinder {
            static var flipViewAlphaBegin: CGFloat = 0.0
            static var flipViewAlphaEnd: CGFloat = 0.8
            static let showFlipViewAnimationTime: Double = 0.3
            static let flipViewAnimationTime: Double = 0.8
        }

        struct DocumentTabsView {
            static let scrollToTabAnimationTime: Double = 0.2
        }
    }
}
