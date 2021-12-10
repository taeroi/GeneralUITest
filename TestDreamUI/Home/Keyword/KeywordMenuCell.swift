//
//  KeywordMenuCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/11/26.
//

import UIKit

final class KeywordMenuCell: BaseCollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }
    
    override func setupSubviews() {
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    override func setTitle(to title: String) {
        label.text = title
    }
    
}
