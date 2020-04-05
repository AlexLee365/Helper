//
//  MotivationViewController.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/30.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

class MotivationViewController: UIViewController {

    private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayoutConstratints()
    }

    private func setupViews() {
        view.backgroundColor = .white

        let tableView = UITableView()
        view.addSubview(tableView)
        self.tableView = tableView
    }

    private func setupLayoutConstratints() {

    }


}
