//
//  Extensions.swift
//  Stash iOS Challenge
//
//  Created by David Nadri on 1/29/19.
//  Copyright © 2019 David Nadri. All rights reserved.
//

import UIKit

extension UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
    
}

extension UICollectionViewCell {
    // Call cell.enable(bool) to create cell enabled/disabled effect
    func enable(on: Bool) {
        //self.isUserInteractionEnabled = on ? true : false
        self.alpha = on ? 1 : 0.4
        for view in contentView.subviews {
            view.isUserInteractionEnabled = on ? true : false
        }
    }
}
