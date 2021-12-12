//
//  BaseCollectionView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        backgroundColor = .white
        
        setupSubviews()
        registerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubviews() { }
    
    func registerCollectionView() { }

}

