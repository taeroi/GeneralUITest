//
//  My_ContentListCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/20.
//

import UIKit

final class MyContentListCell: BaseCollectionViewCell {
    
    // ===== Models =====
    var contentModel = MyContentDataResource
    var bookmarkModel = [MyBookmarkDataResource]
    
    // ===== Properties =====
    var cellType: CellType?
    
    enum CellType {
        case content, bookmark
    }
    
    // ===== UI =====
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}
