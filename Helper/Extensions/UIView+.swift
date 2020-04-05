//
//  UIView+.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

extension UIView {
    func g_roundedCorners(_ corners: UIRectCorner = .allCorners, radius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius

        if #available(iOS 11.0, *) {
            // iOS 10에서는 지원하지 않음
            var cornerMask = CACornerMask()
            if corners.contains(.topLeft) {
                cornerMask.insert(CACornerMask.layerMinXMinYCorner)
            }
            if corners.contains(.topRight) {
                cornerMask.insert(CACornerMask.layerMaxXMinYCorner)
            }
            if corners.contains(.bottomLeft) {
                cornerMask.insert(CACornerMask.layerMinXMaxYCorner)
            }
            if corners.contains(.bottomRight) {
                cornerMask.insert(CACornerMask.layerMaxXMaxYCorner)
            }
            self.layer.maskedCorners = cornerMask
        }
    }

    func g_isHiddenWithAlpha(_ isHidden: Bool, alpha: CGFloat) {
        self.isHidden = isHidden
        self.alpha = alpha
    }

    func g_setShadow(color: CGColor, offset: CGSize, opacity: Float, radius: CGFloat = 3,  path: CGPath? = nil) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowPath = path
    }
}
