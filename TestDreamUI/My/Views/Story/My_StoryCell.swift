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
            width: 100,
            height: 120
        )
        let frame = CGRect(
            x: 0,
            y: 0,
            width: DefaultConstants.shared.screenWidth,
            height: 120
        )
        let layout = MyFlowLayout(itemSize: itemSize)
        
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
        contentView.addSubview(innerCollectionView)
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
