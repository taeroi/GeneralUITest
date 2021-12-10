//
//  LoungeCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import UIKit

final class LoungeCell: BaseTableViewCell {
    
    
    // ===== UI ======
    private let iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.image = nil
        return imageView
    }()
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    
    //MARK: - Setup Views
    
    override func setupSubviews() {
        backgroundColor = .red
        
//        addSubview(<#T##view: UIView##UIView#>)
//        let hStack = UIStackView()
//        hStack.axis = .horizontal
//        hStack.distribution = .fill
//        hStack.alignment = .leading
//        hStack.spacing = 4
//        hStack.addSubview(titleLabel)
//        hStack.addSubview(subTitleLabel)
//
//        addSubview(hStack)
//        hStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
//        hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20).isActive = true
        
    }
    
    
}
