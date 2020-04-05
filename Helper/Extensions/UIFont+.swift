//
//  UIFont+.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

extension UIFont {
    static func g_L(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: size, weight: .light)
    }

    static func g_R(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: size)
    }

    static func g_M(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: size, weight: .medium)
    }

    static func g_SB(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: size, weight: .semibold)
    }

    static func g_B(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: size, weight: .bold)
    }

    static func g_H(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: size, weight: .heavy)
    }

    static func g_monoR(_ size: CGFloat) -> UIFont {
        return monospacedDigitSystemFont(ofSize: size, weight: .regular)
    }

    static func g_monoM(_ size: CGFloat) -> UIFont {
        return monospacedDigitSystemFont(ofSize: size, weight: .medium)
    }

    static func g_monoB(_ size: CGFloat) -> UIFont {
        return monospacedDigitSystemFont(ofSize: size, weight: .bold)
    }

    static func g_monoSB(_ size: CGFloat) -> UIFont {
        return monospacedDigitSystemFont(ofSize: size, weight: .semibold)
    }
}
