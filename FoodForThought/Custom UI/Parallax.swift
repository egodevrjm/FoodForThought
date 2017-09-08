//
//  Parallax.swift
//  Big Bowl
//
//  Created by Ryan Morrison on 08/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

func addParallaxToView(vw: UIView, amount: Int) {
    let amount = amount
    
    let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
    horizontal.minimumRelativeValue = -amount
    horizontal.maximumRelativeValue = amount
    
    let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
    vertical.minimumRelativeValue = -amount
    vertical.maximumRelativeValue = amount
    
    let group = UIMotionEffectGroup()
    group.motionEffects = [horizontal, vertical]
    vw.addMotionEffect(group)
}
