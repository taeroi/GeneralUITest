//
//  KeywordMenuTabBarView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/11/26.
//

import UIKit

protocol MenuBarScrollable: AnyObject {
    func getPageOffset(from index: Int)
}


final class KeywordMenuTabBarView: UIView {
    
    weak var delegate: MenuBarScrollable?

    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupCollectioView()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //===== UI =====
    
    var menuCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: collectionViewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    
    //===== Properties =====
    var indicatorViewLeadingConstraint: NSLayoutConstraint!
    var indicatorViewWidthConstraint: NSLayoutConstraint!
    
    private let keywordMenuCellId = "keywordMenuCellId"
    
    //MARK: - Setup Views
    
    func setupCollectioView(){
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.showsHorizontalScrollIndicator = false
        menuCollectionView.register(KeywordMenuCell.self,
                                    forCellWithReuseIdentifier: keywordMenuCellId)
        
        
        let indexPath = IndexPath(item: 0, section: 0)
        menuCollectionView.selectItem(
            at: indexPath,
            animated: false,
            scrollPosition: []
        )
    }
    
    private func setupViews() {
        self.addSubview(menuCollectionView)
        menuCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        self.addSubview(indicatorView)
        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: self.frame.width / showingKeywordCount)
        indicatorViewWidthConstraint.isActive = true
        indicatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        indicatorViewLeadingConstraint.isActive = true
        indicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}


//MARK: - UICollectionViewDelegate, DataSource

extension KeywordMenuTabBarView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: keywordMenuCellId, for: indexPath) as! KeywordMenuCell
        cell.setTitle(to: "\(indexPath.row + 1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywordCount
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: self.frame.width / showingKeywordCount,
            height: 55
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.getPageOffset(from: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? KeywordMenuCell else {return}
        cell.label.textColor = .lightGray
    }
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension KeywordMenuTabBarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
