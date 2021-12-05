//
//  SecondRowGridContentPageCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/11/26.
//

import UIKit

final class SecondRowGridContentPageCell: BaseCollectionViewCell {

    // ===== UI =====
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var secondRowGridCollectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: SecondRowColumnFlowLayout())

    
    // ====== Properties ======
    private let secondRowGridContentCellId = "secondRowContentCellId"
    
    weak var delegate: NavigationPushable?

    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
//        self.addSubview(label)
//        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(secondRowGridCollectionView)
        secondRowGridCollectionView.translatesAutoresizingMaskIntoConstraints = false
        secondRowGridCollectionView.alwaysBounceVertical = true
        secondRowGridCollectionView.backgroundColor = .gray
        
        secondRowGridCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        secondRowGridCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        secondRowGridCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        secondRowGridCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        secondRowGridCollectionView.delegate = self
        secondRowGridCollectionView.dataSource = self
        secondRowGridCollectionView.register(SecondRowColumnCell.self,
                                    forCellWithReuseIdentifier: secondRowGridContentCellId)
    }
    
}


extension SecondRowGridContentPageCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondRowGridContentCellId, for: indexPath) as? SecondRowColumnCell else {
            return BaseCollectionViewCell()
        }
        cell.indexPathLabel.text = "\(indexPath)"
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selected(at: indexPath)
    }
    
}
