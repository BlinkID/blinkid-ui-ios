//
//  MBScanningOvershadowView.swift
//  MicroBlinkUI
//
//  Created by Dino Gustin on 12/09/2018.
//  Copyright © 2018 Dino Gustin. All rights reserved.
//

import UIKit

class MBShadowView: UIView {
    var shadowColor = UIColor.mb_shadowColor.withAlphaComponent(0.4)
    var scanningRect = CGRect.zero
    var cornerRadius: CGFloat = 0.0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isUserInteractionEnabled = false
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let context = UIGraphicsGetCurrentContext()
        context?.clear(rect)

        let clipPath = UIBezierPath(rect: bounds)
        let scanningPath = UIBezierPath(roundedRect: scanningRect, cornerRadius: cornerRadius)
        clipPath.append(scanningPath)

        clipPath.usesEvenOddFillRule = true
        clipPath.addClip()

        shadowColor.setFill()
        clipPath.fill()
    }
}
