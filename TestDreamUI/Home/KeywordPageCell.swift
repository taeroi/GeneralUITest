//
//  KeywordPageCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/11/26.
//

import UIKit

final class KeywordPageCell: BaseCollectionViewCell {

    
    // ===== UI =====
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var gridCollectionView = UICollectionView(frame: .zero, collectionViewLayout: ColumnFlowLayout())
    
    // ====== Properties ======
    private let contentCellId = "contentCellId"
    
    weak var delegate: NavigationPushable?

    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(gridCollectionView)
        gridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        gridCollectionView.alwaysBounceVertical = true
        gridCollectionView.backgroundColor = .gray
        
        gridCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        gridCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        gridCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        gridCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
        gridCollectionView.register(ContentCell.self,
                                    forCellWithReuseIdentifier: contentCellId)
    }
    
}


extension KeywordPageCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellId, for: indexPath) as? ContentCell else {
            return BaseCollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selected(at: indexPath)
    }
    
}
