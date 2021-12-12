//
//  OneContentCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/10.
//

import UIKit

final class OneContentCell: BaseTableViewCell {
    
    var pushAction: ((_ indexPath: IndexPath) -> ())?
 
    private lazy var oneContentInnerCollectionView: OneContentInnerCollectionView = {
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
        
        let collectionView = OneContentInnerCollectionView(
            frame: frame,
            collectionViewLayout: layout
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
        contentView.addSubview(oneContentInnerCollectionView)
    }
    
}


//MARK: - CollectionView Setup

extension OneContentCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == oneContentInnerCollectionView else { return 0 }
        return OneContentDataResource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == oneContentInnerCollectionView else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusable(OneContentCollectionViewCell.self, for: indexPath)
        cell.model = OneContentDataResource[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushAction?(indexPath)
    }
    
}
