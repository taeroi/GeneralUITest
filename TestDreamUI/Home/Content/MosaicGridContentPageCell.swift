//
//  MosaicGridContentPageCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import UIKit

protocol MosaicGridScrollable: NSObject {
    func mosaicGridScrollItem(at indexPath: IndexPath,
                              at scrollPosition: UICollectionView.ScrollPosition)
}


final class MosaicGridContentPageCell: BaseCollectionViewCell {
    
    // ===== UI =====
    private var mosaicGridCollectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: MosaicGridFlowLayout())
    
    // ====== Properties ======
    private let mosaicGridContentCellId = "mosaicGridContentCellId"
    
    private var gridData: [GridData] = []

    weak var delegate: NavigationPushable?

    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
        
        if mosaicGridCollectionView.numberOfItems(inSection: 0) > 0 {
            mosaicGridCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
        
        setupCollectionView()
        setupData()
    }
    
    private func setupCollectionView() {
        addSubview(mosaicGridCollectionView)
        mosaicGridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mosaicGridCollectionView.alwaysBounceVertical = true
        mosaicGridCollectionView.backgroundColor = .gray
        
        mosaicGridCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mosaicGridCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mosaicGridCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mosaicGridCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        mosaicGridCollectionView.delegate = self
        mosaicGridCollectionView.dataSource = self
        mosaicGridCollectionView.register(MosaicGridCell.self,
                                    forCellWithReuseIdentifier: mosaicGridContentCellId)
    }
    
    private func setupData() {
        (0...150).forEach {
            let color = UIColor(red: CGFloat(drand48()),
                                green: CGFloat(drand48()),
                                blue: CGFloat(drand48()),
                                alpha: CGFloat(Float(arc4random()) / Float(UINT32_MAX)))
            gridData.append(GridData(color: color, title: String($0)))
        }
    }
    
}


extension MosaicGridContentPageCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gridData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mosaicGridContentCellId, for: indexPath) as? MosaicGridCell else {
            return BaseCollectionViewCell()
        }
        cell.indexPathLabel.text = gridData[indexPath.item].title
        cell.backgroundColor = gridData[indexPath.item].color
//        cell.indexPathLabel.text = "\(indexPath)"
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate?.selected(at: indexPath)
//    }
    
}


struct GridData {
    let color: UIColor
    let title: String
}
