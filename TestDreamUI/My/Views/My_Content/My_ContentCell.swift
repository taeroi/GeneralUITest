//
//  My_ContentCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/17.
//

import UIKit

final class MyContentCell: BaseTableViewCell {
    
    
    // ===== UI =====
    private var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                              collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    //MARK: - Setup, Register
    
    override func setupSubviews() {
        registerCollectionView()
    }
    
    private func registerCollectionView() {
        
    }
    
    
}


extension MyContentCell: ContentMenuTappable {
    
    func getTapOffset(from index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        
        let header = MyContentHeader()
        header.menuCollectionView.selectItem(
            at: indexPath,
            animated: true,
            scrollPosition: []
        )
        
        
    }
    
}
