//
//  SecondRowColumnCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import Foundation
import UIKit

final class SecondRowColumnCell: BaseCollectionViewCell {
    
    // ===== UI =====
    let indexPathLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupSubviews() {
        layer.cornerRadius = 20.0
        
        addSubview(indexPathLabel)
        indexPathLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indexPathLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     

    }
}
