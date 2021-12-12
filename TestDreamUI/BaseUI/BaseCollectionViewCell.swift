//
//  BaseCollectionViewCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/11/26.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        setTitle(to: "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubviews(){ }
    
    func setTitle(to title: String){ }
}
