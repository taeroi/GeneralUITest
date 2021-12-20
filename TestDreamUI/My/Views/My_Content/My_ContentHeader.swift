//
//  My_ContentHeader.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/17.
//

import UIKit

protocol ContentMenuTappable: AnyObject {
    func getTapOffset(from index: Int)
}

final class MyContentHeader: UITableViewHeaderFooterView {
    
    //===== Properties =====
    weak var delegate: ContentMenuTappable?
    
    let tapMenuList = [
        "컨텐츠",
        "북마크"
    ]
    
    //===== UI =====
    var menuCollectionView: BaseCollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        let collectionView = BaseCollectionView(
            frame: CGRect(x: 0, y: 0, width: 0, height: 0),
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var indicatorView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    
    //MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        registerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup Views
    
    private func setupViews() {
        layer.masksToBounds = true
        
        addSubview(menuCollectionView)
        menuCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    
    //MARK: - Register CollectionView
    
    private func registerCollectionView() {
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.registerClassCell(MyContentHeaderInnerCell.self)
        
        let indexPath = IndexPath(item: 0, section: 0)
        menuCollectionView.selectItem(
            at: indexPath,
            animated: false,
            scrollPosition: []
        )
        
    }
    
    
}


//MARK: - CollectionView Delegate & DataSource

extension MyContentHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tapMenuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCollectionViewCell(MyContentHeaderInnerCell.self, for: indexPath)
        cell.setTitle(to: tapMenuList[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.getTapOffset(from: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MyContentHeaderInnerCell else { return }
        cell.titleLabel.textColor = .lightGray
    }
    
}


//MARK: - Delegate FlowLayout

extension MyContentHeader: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
