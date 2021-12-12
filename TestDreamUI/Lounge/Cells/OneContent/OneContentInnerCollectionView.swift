//
//  OneContentInnerCollectionView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

final class OneContentInnerCollectionView: UICollectionView {
    
    
    //MARK: - Initalizer
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white

        register()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Register
    
    private func register() {
        
        decelerationRate = UIScrollView.DecelerationRate.fast
        registerClassCell(OneContentCollectionViewCell.self)
        showsHorizontalScrollIndicator = false
    }
    
}
