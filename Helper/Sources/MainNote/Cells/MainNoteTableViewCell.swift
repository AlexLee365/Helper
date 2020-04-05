//
//  MainNoteTableViewCell.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

class MainNoteTableViewCell: UITableViewCell {
    
    private weak var dateCircleView: UIView!
    private weak var dateVerticalDownLineView: UIView!
    private weak var dateVerticalUpLineView: UIView!
    private weak var dateLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayoutConstratints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(isFirstCell: Bool = false, isLastCell: Bool = false) {
        dateVerticalUpLineView.isHidden = isFirstCell
        dateVerticalDownLineView.isHidden = isLastCell
    }
    
    private func setupViews() {
        self.selectionStyle = .none 
        self.backgroundColor = .white
        
        let dateVerticalLineView = UIView()
        dateVerticalLineView.backgroundColor = .lightGray
        contentView.addSubview(dateVerticalLineView)
        self.dateVerticalDownLineView = dateVerticalLineView
        
        let dateVerticalUpLineView = UIView()
        dateVerticalUpLineView.backgroundColor = .lightGray
        contentView.addSubview(dateVerticalUpLineView)
        self.dateVerticalUpLineView = dateVerticalUpLineView
        
        let dateCircleView = UIView()
        dateCircleView.backgroundColor = Environments.shared.mainColor
        dateCircleView.g_roundedCorners(radius: 5)
        contentView.addSubview(dateCircleView)
        self.dateCircleView = dateCircleView
        
        let dateLabel = UILabel()
        dateLabel.text = "3.28 토"
        dateLabel.textColor = .black
        dateLabel.font = .g_B(18)
        contentView.addSubview(dateLabel)
        self.dateLabel = dateLabel
    
    }
    
    private func setupLayoutConstratints() {
        dateVerticalDownLineView.snp.makeConstraints {
            $0.top.equalTo(dateCircleView.snp.centerY)
            $0.centerX.equalTo(dateCircleView)
            $0.width.equalTo(2)
            $0.bottom.equalToSuperview()
        }
        
        dateVerticalUpLineView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalTo(dateCircleView)
            $0.width.equalTo(2)
            $0.bottom.equalTo(dateCircleView.snp.centerY)
        }
        
        dateCircleView.snp.makeConstraints {
            $0.leading.equalTo(25)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(10)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(dateCircleView).offset(20)
            $0.centerY.equalTo(dateCircleView)
        }
    }

}
