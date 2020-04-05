//
//  HelperTabBarController.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/30.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

class HelperTabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    private func initialize() {
        let mainNoteViewController = MainNotesViewController()
        mainNoteViewController.g_setTabBarItem(title: "기록", image: UIImage("star"), selectedImage: UIImage("star"))

        let doExerciseViewController = DoExerciseViewController()
        doExerciseViewController.g_setTabBarItem(title: "도전", image: UIImage("star2"), selectedImage: UIImage("star2"))

        let motivationViewController = MotivationViewController()
        motivationViewController.g_setTabBarItem(title: "운동 자극", image: UIImage("star3"), selectedImage: UIImage("star3"))

        viewControllers = [mainNoteViewController, doExerciseViewController, motivationViewController]

        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = UIColor.black.withAlphaComponent(0.6)
    }
}
