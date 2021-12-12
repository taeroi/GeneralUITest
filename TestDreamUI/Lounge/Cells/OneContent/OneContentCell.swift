//
//  OneContentCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/10.
//

import UIKit

final class OneContentCell: BaseTableViewCell {
    
    var pushClosure: ((_ indexPath: IndexPath) -> ())?
 
    private lazy var oneContentInnerCollectionView: OneContentInnerCollectionView = {
        let itemSize = CGSize(width: scrrenWidth - 2 * LoungeConstants.leftMargin, height: LoungeConstants.oneContentCellHeight)
        let frame = CGRect(x: 0, y: 0, width: scrrenWidth, height: LoungeConstants.oneContentCellHeight)
        let layout = LoungeFlowlayout(itemSize: itemSize)
        
        let collectionView = OneContentInnerCollectionView(frame: frame,
                                                           collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func setupSubviews() {
        contentView.addSubview(oneContentInnerCollectionView)
    }
    
}


//MARK: - CollectionView

extension OneContentCell: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == oneContentInnerCollectionView {
            return OneContentDataResource.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == oneContentInnerCollectionView {
            let cell = collectionView.dequeueReusable(OneContentCollectionViewCell.self, for: indexPath)
            cell.model = OneContentDataResource[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushClosure?(indexPath)
    }
}


//MARK: - Mock Data

fileprivate let OneContentDataResource: [OneContentModel] = [
    OneContentModel(
        feature: "MAJOR UPDATE",
        name: "Mock 1",
        description: "Cards",
        coverImageName: "cover_1"
    ),
    
    OneContentModel(
        feature: "NEW GAME",
        name: "Mock 2",
        description: "Strategy",
        coverImageName: "cover_2"
    ),
    
    OneContentModel(
        feature: "REDISCOVER THIS",
        name: "Mock 3",
        description: "Adventure",
        coverImageName: "cover_3"
    )
]

