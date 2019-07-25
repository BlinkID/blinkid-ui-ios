//
//  MBViewfinderView.swift
//  BlinkIDUI
//
//  Created by Jure Čular on 07/11/2018.
//  Copyright © 2018 Microblink. All rights reserved.
//

import UIKit

@IBDesignable
class MBViewfinderView: UIView, MBNibLoadable {

    // MARK: - Outlets -

    @IBOutlet private var _topToScanLineConstraint: NSLayoutConstraint!
    @IBOutlet private var _bottomToScanLineConstraint: NSLayoutConstraint!
    @IBOutlet private var _corners: [UIImageView]! {
        didSet {
            for corner in _corners {
                corner.tintColor = UIColor.mb_secondaryColor
            }
        }
    }
    @IBOutlet private weak var _scanLine: UIImageView! {
        didSet {
            _scanLine.tintColor = UIColor.mb_primaryColor
        }
    }
    @IBOutlet private weak var _flipView: UIView! {
        didSet {
            _flipView.alpha = MBConstants.Animation.Viewfinder.flipViewAlphaBegin
            _flipView.isHidden = true
            _flipView.backgroundColor = UIColor.mb_primaryColor
        }
    }
    @IBOutlet private weak var _flipImage: UIImageView! {
        didSet {
            _flipImage.tintColor = UIColor.mb_secondaryColor
        }
    }

    // MARK: - Initializers -

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }

    // MARK: - Public -

    func startScanLineAnimation() {
        _topToScanLineConstraint.isActive = false
        _animateScanLineFromBottomToTop()
    }

    func startFlipAnimation() {
        _animateFlipViewShow()
    }

    // MARK: - Animations -

    private func _animateFlipViewShow() {
        _scanLine.isHidden = true
        _flipView.isHidden = false
        _flipView.alpha = MBConstants.Animation.Viewfinder.flipViewAlphaBegin
        UIView.animate(withDuration: MBConstants.Animation.Viewfinder.showFlipViewAnimationTime, delay: 0.0, options: .curveEaseOut, animations: {
            self._flipView.alpha = MBConstants.Animation.Viewfinder.flipViewAlphaEnd
        }, completion: { _ in
          self._animateFlip()
        })

    }

    private func _animateFlip() {
        UIView.transition(with: _flipView, duration: MBConstants.Animation.Viewfinder.flipViewAnimationTime, options: .transitionFlipFromLeft, animations: nil) { _ in
            self._animateFlipViewHide()
        }
    }

    private func _animateFlipViewHide() {
        _flipView.alpha = MBConstants.Animation.Viewfinder.flipViewAlphaEnd
        UIView.animate(withDuration: MBConstants.Animation.Viewfinder.showFlipViewAnimationTime, delay: 0.0, options: .curveEaseOut, animations: {
            self._flipView.alpha = MBConstants.Animation.Viewfinder.flipViewAlphaBegin
        }, completion: { _ in
            self._flipView.isHidden = true
            self._scanLine.isHidden = false
        })

    }

    private func _animateScanLineFromTopToBottom() {
        UIView.animate(withDuration: TimeInterval(bounds.size.height / MBConstants.Animation.ScanLine.speed), delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self._topToScanLineConstraint.isActive = false
            self._bottomToScanLineConstraint.isActive = true
            self.layoutIfNeeded()
        }) { [weak self] _ in
            guard let self = self else { return }
            self._animateScanLineFromBottomToTop()
        }
    }

    private func _animateScanLineFromBottomToTop() {
        UIView.animate(withDuration: TimeInterval(bounds.size.height / MBConstants.Animation.ScanLine.speed), delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self._bottomToScanLineConstraint.isActive = false
            self._topToScanLineConstraint.isActive = true
            self.layoutIfNeeded()
        }) { [weak self] _ in
            guard let self = self else { return }
            self._animateScanLineFromTopToBottom()
        }
    }

}
