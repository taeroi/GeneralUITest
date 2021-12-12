//
//  SecondRowColumnFlowLayout.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import Foundation
import UIKit

class SecondRowColumnFlowLayout: UICollectionViewFlowLayout {
    
    // ===== Properties =====
    //
    // cell 너비의 최소값만 알고 있으면 뷰에 알아서 grid형태이든, tableView형태이든 알아서 뿌려지는 형태
    private let minColumnWidth: CGFloat = UIScreen.main.bounds.width / 3
    private let cellHeight: CGFloat = UIScreen.main.bounds.height / 3
    
    // cell의 레이아웃 업데이트 전에 호출하여 레이아웃 적용
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)

        itemSize = CGSize(width: cellWidth, height: cellHeight)
        sectionInset = UIEdgeInsets(top: minimumInteritemSpacing,
                                    left: 0.0,
                                    bottom: minimumInteritemSpacing,
                                    right: 0.0)
        sectionInsetReference = .fromSafeArea
    }
}
