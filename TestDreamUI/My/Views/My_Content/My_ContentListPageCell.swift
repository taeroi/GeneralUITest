//
//  My_ContentListPageCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/17.
//

import UIKit

final class MyContentListPageCell: BaseTableViewCell {
    
    
    // ===== UI =====
    private var pageCollectionView: BaseCollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = BaseCollectionView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 100,
                height: 100
            ),
            collectionViewLayout: collectionViewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    //MARK: - Setup, Register
    
    override func setupSubviews() {
        
        contentView.addSubview(pageCollectionView)
        pageCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pageCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        registerCollectionView()
    }
    
    private func registerCollectionView() {
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.registerClassCell(MyContentListCell.self)
    }
    
}


//MARK: - CollectionView Delegate, DataSource

extension MyContentListPageCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyContentDataResource.count > MyBookmarkDataResource.count ?
        MyContentDataResource.count :
        MyBookmarkDataResource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCollectionViewCell(MyContentListCell.self, for: indexPath)
        cell.titleLabel.text = "\(MyContentDataResource[indexPath.row])"
        return cell
        
    }
    
    //    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    //        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
    //        let indexPath = IndexPath(item: itemAt, section: 0)
    //
    //        let lastContentOffset: CGFloat = 0
    //
    //        if lastContentOffset > scrollView.contentOffset.x {
    //            print("drag left")
    //            keywordMenuTabBarView.menuCollectionView.selectItem(at: indexPath,
    //                                                                animated: true,
    //                                                                scrollPosition: .left)
    //        } else {
    //            print("drag right")
    //            keywordMenuTabBarView.menuCollectionView.selectItem(at: indexPath,
    //                                                                animated: true,
    //                                                                scrollPosition: .centeredHorizontally)
    //        }
    //    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension MyContentListPageCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


//MARK: - Content Menu Tappable

extension MyContentListPageCell: ContentMenuTappable {
    
    func getTapOffset(from index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        
        let header = MyContentTapHeader()
        header.menuCollectionView.selectItem(
            at: indexPath,
            animated: true,
            scrollPosition: []
        )
        
        
    }
    
}
