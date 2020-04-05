//
//  AppDelegate.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpWindow()

        return true
    }

    private func setUpWindow() {
        let helperTabbbarController = HelperTabBarController()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = helperTabbbarController
        self.window = window

        window.makeKeyAndVisible()
    }
}

