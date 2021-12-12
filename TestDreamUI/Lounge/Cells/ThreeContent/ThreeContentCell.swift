//
//  ThreeContentCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import UIKit

final class ThreeContentCell: BaseTableViewCell {
   
    var pushAction: ((_ indexPath: IndexPath)->())?
    var pressedGetButtonAction: ((_ model: ThreeContentModel) -> ())?
    
    
    // ===== UI ======
    
    private lazy var threeContentInnerCollectionView: ThreeContentInnerCollectionView = {
        let itemSize = CGSize(
            width: screenWidth - 2 * LoungeConstants.leftMargin,
            height: 80
        )
        let frame = CGRect(
            x: 0,
            y: 0,
            width: screenWidth,
            height: 80 * 3
        )
        let layout = LoungeFlowlayout(itemSize: itemSize)
        let collectionView = ThreeContentInnerCollectionView(
            frame: frame,
            collectionViewLayout: layout
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    
    //MARK: - Setup Subviews

    override func setupSubviews() {
        contentView.addSubview(threeContentInnerCollectionView)
    }
    
}


//MARK: - CollectionView Setup

extension ThreeContentCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard collectionView == threeContentInnerCollectionView else { return 0 }
        return ThreeContentDataResource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard collectionView == threeContentInnerCollectionView else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusable(ThreeContentCollectionViewCell.self, for: indexPath)
        cell.delegate = self
        cell.model = ThreeContentDataResource[indexPath.row]
        cell.bottomLineView.isHidden = (((indexPath.row + 1) % 3 == 0) || (indexPath.row == ThreeContentDataResource.count - 1))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushAction?(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ThreeContentCollectionViewCell else { return }
        cell.connectGesture()
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? ThreeContentCollectionViewCell else { return }
        cell.disconnectGesture()
    }
    
}


//MARK: - Touch Delegate

extension ThreeContentCell: ButtonTouchable {
    
    func handleDownloadButtonTapped(_ cell: ThreeContentCollectionViewCell) {
        guard let indexPath = threeContentInnerCollectionView.indexPath(for: cell) else { return }
        pressedGetButtonAction?(ThreeContentDataResource[indexPath.item])
    }
    
}
