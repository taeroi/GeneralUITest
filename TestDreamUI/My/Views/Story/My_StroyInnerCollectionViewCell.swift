//
//  My_StroyInnerCollectionViewCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/20.
//

import UIKit

final class MyStroyInnerCollectionViewCell: BaseCollectionViewCell {
    
    // ===== Model =====
    var model: MyStoryModel! {
        didSet {
            coverImageView.image = UIImage(named: model.coverImageName)
            titleLabel.text = model.title
        }
    }
    
    // ===== UI =====
    var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
        addSubview(coverImageView)
        coverImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        coverImageView.heightAnchor.constraint(equalTo: coverImageView.widthAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
}
