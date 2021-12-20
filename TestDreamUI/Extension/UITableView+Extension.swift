//
//  UITableView+Extension.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

extension UITableView {

    func registerNibCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let nib = UINib(nibName: "\(cellType)", bundle: nil)
        let identifier = "\(cellType)"
        register(nib, forCellReuseIdentifier: identifier)
    }

    func registerClassCell<T>(_ cellType: T.Type) where T: UITableViewCell {
        let identifier = "\(cellType)"
        register(cellType, forCellReuseIdentifier: identifier)
    }

    func dequeueReusable<T: UITableViewCell>(_ cell: T.Type,
                                             for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
    
    func registerNibHeaderFooterView<T>(_ viewType: T.Type) where T: UITableViewHeaderFooterView {
        let nib = UINib(nibName: "\(viewType)", bundle: nil)
        let identifier = "\(viewType)"
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerClassHeaderFooterView<T>(_ viewType: T.Type) where T: UITableViewHeaderFooterView {
        let identifier = "\(viewType)"
        register(viewType, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) -> T {
        let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: "\(T.self)") as! T
        return headerFooterView
    }
}
