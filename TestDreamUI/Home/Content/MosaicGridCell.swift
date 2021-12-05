//
//  MosaicGridCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import UIKit

final class MosaicGridCell: BaseCollectionViewCell {
    
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
        
        addSubview(indexPathLabel)
        indexPathLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indexPathLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
     

    }
}
