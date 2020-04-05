//
//  UIViewController+.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/30.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

public extension UIViewController {
    func g_setTabBarItem(title: String, image: UIImage?, selectedImage: UIImage?) {
        tabBarItem = UITabBarItem(title: title, image: image?.g_asOriginal, selectedImage: selectedImage?.g_asOriginal)

        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.g_M(11),
                                           NSAttributedString.Key.foregroundColor: Environments.shared.mainColor,
                                           NSAttributedString.Key.backgroundColor: UIColor.black], for: .normal)
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 8)
    }
}
