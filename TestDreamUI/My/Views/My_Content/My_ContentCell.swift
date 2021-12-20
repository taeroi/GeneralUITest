//
//  My_ContentCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/20.
//

import UIKit

final class MyContentCell: BaseCollectionViewCell {
    
    var titleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
}
