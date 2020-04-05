//
//  MainNoteViewController.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import RxSwift
import RxCocoa
import SnapKit
import UIKit

class MainNotesViewController: UIViewController {
    private weak var tableView: UITableView!
    private weak var makeNoteButton: UIButton!
    
    private var tempData = [1,2,3,4,5]
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayoutConstratints()
        
        makeNoteButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let makeNoteViewController = MakeNoteViewController()
                self?.present(makeNoteViewController, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 120
        tableView.insetsContentViewsToSafeArea = false
        tableView.separatorStyle = .none
        tableView.g_registerCellClass(cellType: MainNoteTableViewCell.self)
        view.addSubview(tableView)
        self.tableView = tableView
        
        let makeNoteButton = UIButton()
        makeNoteButton.setImage(UIImage("plusButton"), for: .normal)
        view.addSubview(makeNoteButton)
        self.makeNoteButton = makeNoteButton
    }
    
    private func setupLayoutConstratints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        makeNoteButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide).offset(-40)
            $0.size.equalTo(50)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

}

extension MainNotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.g_dequeueReusableCell(cellType: MainNoteTableViewCell.self, indexPath: indexPath)
        cell.setData(isFirstCell: indexPath.row == 0, isLastCell: indexPath.row == tempData.count - 1)
        
        return cell
    }
    
    
}
