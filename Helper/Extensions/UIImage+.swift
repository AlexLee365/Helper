//
//  UIImage+.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

public extension UIImage {
    convenience init(_ named: String) {
        if UIImage(named: named) != nil{
            self.init(named: named)!
        } else {
            self.init()
        }
    }

    func g_addInsets(insets: UIEdgeInsets) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: insets.left + size.width + insets.right, height: insets.top + size.height + insets.bottom), false, 0)
        draw(at: CGPoint(x: insets.left, y: insets.top))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    var g_asTemplate: UIImage {
        return withRenderingMode(.alwaysTemplate)
    }

    var g_asOriginal: UIImage {
        return withRenderingMode(.alwaysOriginal)
    }

    func g_changeColor(to color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        let rect = CGRect(origin: .zero, size: size)
        draw(in: rect)
        context.setFillColor(color.cgColor);
        context.setBlendMode(.sourceAtop)
        context.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image ?? UIImage()
    }

    var g_isPortrait:  Bool {
        return size.height > size.width
    }

    var g_isLandscape: Bool {
        return size.width > size.height
    }

    /// 이미지를 원형으로 마스킹한다. CPU를 많이 사용하기 때문에 꼭 필요한 경우에만 사용하고 그 외에는 g_squareImageWithHole(color:size)를 사용하는 것이 좋다.
    var g_circleMasked: UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        draw(in: CGRect(origin: CGPoint.zero, size: size), blendMode: .copy, alpha: 1.0)

        context.setBlendMode(.copy)
        context.setFillColor(UIColor.clear.cgColor)

        let rectPath = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: size))
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: size))
        rectPath.append(circlePath)
        rectPath.usesEvenOddFillRule = true
        rectPath.fill()

        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func g_shadow(blur: CGFloat = 1, shadowColor: UIColor = .black, offset: CGSize = CGSize(width: 1, height: 1) ) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width + 2 * blur, height: size.height + 2 * blur), false, scale)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        context.setShadow(offset: offset, blur: blur, color: shadowColor.cgColor)
        draw(in: CGRect(x: blur - offset.width / 2, y: blur - offset.height / 2, width: size.width, height: size.height))

        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func g_rotatedToUpOrientation() -> UIImage? {
        if imageOrientation == .up {
            return self
        }

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }

        draw(in: CGRect(origin: .zero, size: size))

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

/// Image Factory
public extension UIImage {
    static let g_blackRoundRectRadius3pxResizableFrame = g_squareWithRoundRectHole(color: .black, size: CGSize(width: 10, height: 10), radius: 3, resizable: true)
    static let g_blackRoundRectRadius4pxResizableFrame = g_squareWithRoundRectHole(color: .black, size: CGSize(width: 20, height: 20), radius: 4, resizable: true)
    static let g_blackRoundRectRadius5pxResizableFrame = g_squareWithRoundRectHole(color: .black, size: CGSize(width: 20, height: 20), radius: 5, resizable: true)
    static let g_blackRoundRectRadius6pxResizableFrame = g_squareWithRoundRectHole(color: .black, size: CGSize(width: 20, height: 20), radius: 6, resizable: true)

    static let g_emptyProfile1 = UIImage(named: "img_empty_profile_1.png")!
    static let g_emptyProfile2 = UIImage(named: "img_empty_profile_2.png")!
    static let g_emptyProfile3 = UIImage(named: "img_empty_profile_3.png")!
    static let g_emptyProfile4 = UIImage(named: "img_empty_profile_4.png")!
    static let g_emptyProfile5 = UIImage(named: "img_empty_profile_5.png")!
    static let g_emptyProfile6 = UIImage(named: "img_empty_profile_6.png")!

    static let g_emptyCover1 = UIImage(named: "img_empty_cover_1.png")!
    static let g_emptyCover2 = UIImage(named: "img_empty_cover_2.png")!

    /// 1x1 이미지 생성
    static func g_color(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        defer { UIGraphicsEndImageContext() }

        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!

        return image
    }

    /// 가운데가 원형으로 뚫린 액자형 이미지. 네모 이미지 위에 덮어서 원형 프로필로 만드는 등에 사용한다.
    static func g_squareWithHole(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        let rect = CGRect(origin: .zero, size: size)

        // 사각형과 원을 그린다.
        context.addRect(rect)
        context.addEllipse(in: rect)

        // 뚫린 부분을 제외하고 사각형에 색을 칠한다.
        context.setFillColor(color.cgColor)
        context.fillPath(using: .evenOdd)

        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }

    /// round rect로 뚫린 사각형. 네모 이미지 위에 덮어서 사용
    static func g_squareWithRoundRectHole(color: UIColor, size: CGSize, byRoundingCorners: UIRectCorner = .allCorners, radius: CGFloat, resizable: Bool = false) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        let rect = CGRect(origin: .zero, size: size)
        let clipPath = UIBezierPath(roundedRect: rect, byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath

        context.addRect(rect)
        context.addPath(clipPath)

        context.setFillColor(color.cgColor)
        context.fillPath(using: .evenOdd)

        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        if resizable {
            let horizontalInset = (size.width <= radius * 2) ? 0 : round(size.width / 2) - 1
            let verticalInset = (size.height <= radius * 2) ? 0 : round(size.height / 2) - 1
            let edgeInsets = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
            return image.resizableImage(withCapInsets: edgeInsets)
        }

        return image
    }

    static func g_roundRect(fillColor: UIColor? = nil, fillShadowColor: UIColor? = nil, size: CGSize, byRoundingCorners: UIRectCorner = .allCorners,
                            radius: CGFloat, borderColor: UIColor? = nil, borderShadowColor: UIColor? = nil, lineWidth: CGFloat = 0, resizable: Bool = false) -> UIImage {
        let sizeWithShadow = fillShadowColor == nil && borderShadowColor == nil ? size : CGSize(width: size.width, height: size.height + 2)
        UIGraphicsBeginImageContextWithOptions(sizeWithShadow, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        let rect = CGRect(origin: CGPoint(x: lineWidth / 2, y: lineWidth / 2), size: CGSize(width: size.width - lineWidth, height: size.height - lineWidth))
        let borderPath = UIBezierPath(roundedRect: rect, byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath

        if let fillColor = fillColor {
            context.addPath(borderPath)
            context.setFillColor(fillColor.cgColor)
            context.setShadow(offset: CGSize(width: 0, height: 0.5), blur: 1, color: fillShadowColor?.cgColor)
            context.fillPath()
        }

        if let borderColor = borderColor {
            context.addPath(borderPath)
            context.setStrokeColor(borderColor.cgColor)
            context.setLineWidth(lineWidth)
            context.setShadow(offset: CGSize(width: 0, height: 0.5), blur: 1, color: borderShadowColor?.cgColor)
            context.strokePath()
        }

        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        if resizable {
            let horizontalInset = (size.width <= radius * 2) ? 0 : round(size.width / 2) - 1
            let verticalInset = (size.height <= radius * 2) ? 0 : round(size.height / 2) - 1
            let edgeInsets = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
            return image.resizableImage(withCapInsets: edgeInsets)
        }

        return image
    }

    static func g_circle(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        let rect = CGRect(origin: .zero, size: size)
        let clipPath = UIBezierPath(ovalIn: rect).cgPath

        context.addPath(clipPath)
        context.setFillColor(color.cgColor)
        context.fillPath()

        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }

    // 가로로 그라데이션이 들어간 이미지
    static func g_horizontalGradientImage(from colors: [UIColor], width: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: 1)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }

        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }

        let colorspace = CGColorSpaceCreateDeviceRGB()
        let cgColors = colors.map { $0.cgColor }

        guard let gradient = CGGradient(colorsSpace: colorspace, colors: cgColors as CFArray, locations: nil) else {
            return UIImage()
        }

        context.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: width, y: 0), options: [])

        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}
