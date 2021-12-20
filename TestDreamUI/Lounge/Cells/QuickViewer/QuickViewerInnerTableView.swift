//
//  QuickViewerInnerTableView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

final class QuickViewerInnerTableView: BaseTableView {
    
    override func setupSubviews() {
        rowHeight = DefaultConstants.shared.lounge .quickViewerInnerCellHeight
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    override func registerTableView() {
        register(UITableViewCell.self, forCellReuseIdentifier: mockTableViewCellID)
    }
    
}
