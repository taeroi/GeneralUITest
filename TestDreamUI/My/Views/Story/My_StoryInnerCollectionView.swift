//
//  My_StoryInnerCollectionView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/20.
//

import UIKit

final class MyStoryInnerCollectionView: BaseCollectionView {
    
    
    override func registerCollectionView() {
        decelerationRate = UIScrollView.DecelerationRate.fast
        registerClassCell(MyStroyInnerCollectionViewCell.self)
    }
    
}
