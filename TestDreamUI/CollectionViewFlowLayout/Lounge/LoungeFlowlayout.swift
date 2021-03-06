//
//  LoungeFlowlayout.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

class LoungeFlowlayout: UICollectionViewFlowLayout {
    
    init(itemSize: CGSize) {
        super.init()
        self.itemSize = itemSize
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        scrollDirection = UICollectionView.ScrollDirection.horizontal
        minimumInteritemSpacing = 0
        minimumLineSpacing = 10
        sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        // Page width used for estimating and calculating paging.
        let pageWidth = itemSize.width + minimumLineSpacing
        
        // Make an estimation of the current page position.
        let approximatePage = collectionView!.contentOffset.x/pageWidth
        
        // Determine the current page based on velocity.
        let currentPage = (velocity.x < 0.0) ? floor(approximatePage) : ceil(approximatePage)
        
        // Create custom flickVelocity.
        let flickVelocity = velocity.x * 0.3
        
        // Check how many pages the user flicked, if <= 1 then flickedPages should return 0.
        let flickedPages = (abs(round(flickVelocity)) <= 1) ? 0 : round(flickVelocity)
        
        // Calculate newHorizontalOffset.
        let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - self.collectionView!.contentInset.left
        
        return CGPoint(
            x: newHorizontalOffset,
            y: proposedContentOffset.y
        )
    }
    
}
