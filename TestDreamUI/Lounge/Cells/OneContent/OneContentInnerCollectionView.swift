//
//  OneContentInnerCollectionView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

final class OneContentInnerCollectionView: BaseCollectionView {
    
    
    //MARK: - Register
    
    override func registerCollectionView() {
        
        decelerationRate = UIScrollView.DecelerationRate.fast
        registerClassCell(OneContentCollectionViewCell.self)
        showsHorizontalScrollIndicator = false
    }
    
}
