//
//  My_StoryCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/17.
//

import UIKit

final class MyStoryCell: BaseTableViewCell {
    
    var pushAction: ((_ indexPath: IndexPath) -> ())?
    
    private lazy var innerCollectionView: MyStoryInnerCollectionView = {
        let itemSize = CGSize(
            width: screenWidth - 3 * LoungeConstants.leftMargin,
            height: LoungeConstants.oneContentCellHeight
        )
        let frame = CGRect(
            x: 0,
            y: 0,
            width: screenWidth,
            height: LoungeConstants.oneContentCellHeight
        )
        let layout = LoungeFlowlayout(itemSize: itemSize)
        
        let collectionView = MyStoryInnerCollectionView(
            frame: frame,
            collectionViewLayout: layout
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
        addSubview(innerCollectionView)
    }
    
}


//MARK: - Setup CollectionViews

extension MyStoryCell: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyStoryDataResource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusable(MyStroyInnerCollectionViewCell.self, for: indexPath)
        cell.model = MyStoryDataResource[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushAction?(indexPath)
    }
    
}
