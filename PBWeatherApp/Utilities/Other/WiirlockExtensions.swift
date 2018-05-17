//
//  WiirlockExtensions.swift
//  YahooWeather
//
//  Created by Nilesh Uttekar on 17/05/2018.
//  Copyright © 2018 Nilesh Uttekar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func makeBloorImage(targetImageView:UIImageView) {
        let bloor = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let bloorView = UIVisualEffectView(effect: bloor)
        bloorView.alpha = 0.5
        bloorView.frame = targetImageView.bounds
        
        bloorView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        targetImageView.addSubview(bloorView)
    }
}
