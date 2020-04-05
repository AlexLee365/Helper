//
//  UIColor+.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(_ red: Int, _ green: Int, _ blue: Int) {
        self.init(red, green, blue, 1)
    }
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat = 1) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }

    convenience init(_ hex: UInt32) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    convenience init(_ hex: String) {
        var hexInt: UInt32 = 0
        let scanner: Scanner = Scanner(string: hex)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)

        self.init(hexInt)
    }

    func g_reactToDarkMode(with darkModeColor: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    /// Return the color for Dark Mode
                    return darkModeColor
                } else {
                    /// Return the color for Light Mode
                    return self
                }
            }
        } else {
            /// Return a fallback color for iOS 12 and lower.
            return self
        }
    }

    var g_asHex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let rgb: Int = Int(red * 255) << 16 | Int(green * 255) << 8 | Int(blue * 255) << 0

        return String(format: "#%06x", rgb)
    }

    static var g_random: UIColor {
        return UIColor(Int.random(in: 0...255), Int.random(in: 0...255), Int.random(in: 0...255))
    }
}
