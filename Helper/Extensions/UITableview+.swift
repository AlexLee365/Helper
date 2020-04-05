//
//  UITableview+.swift
//  Helper
//
//  Created by 행복한 개발자 on 2020/03/28.
//  Copyright © 2020 Alex Lee. All rights reserved.
//

import UIKit

public extension UITableView {
    func g_registerCellNib(cellType: UITableViewCell.Type) {
        let cellName = "\(cellType)"
        register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
    func g_registerCellClass(cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: "\(cellType)")
    }
    
    func g_registerHeaderFooterNib(headerFooterType: UITableViewHeaderFooterView.Type) {
        let headerFooterName = "\(headerFooterType)"
        register(UINib(nibName: headerFooterName, bundle: nil), forCellReuseIdentifier: headerFooterName)
    }
    
    func g_registerHeaderFooterClass(headerFooterType: UITableViewHeaderFooterView.Type) {
        register(headerFooterType, forHeaderFooterViewReuseIdentifier: "\(headerFooterType)")
    }
    
    func g_dequeueReusableCell<T: UITableViewCell>(cellType: T.Type = T.self, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(cellType)", for: indexPath) as! T
    }
    
    func g_dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(headerFooterType: T.Type = T.self) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: "\(headerFooterType)") as! T
    }
}
