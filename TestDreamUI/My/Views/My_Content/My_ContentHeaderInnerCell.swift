//
//  My_ContentHeaderInnerCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/17.
//

import UIKit

final class MyContentHeaderInnerCell: BaseCollectionViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            self.titleLabel.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override func setTitle(to title: String) {
        titleLabel.text = title
    }
    
    override func setupSubviews() {
        self.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
