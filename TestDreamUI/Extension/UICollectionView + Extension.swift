//
//  UICollectionView + Extension.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/20.
//

import UIKit

extension UICollectionView {

    func registerNibCell<T>(_ cellType: T.Type) where T: UICollectionViewCell {
        let nib = UINib(nibName: "\(cellType)", bundle: nil)
        let identifier = "\(cellType)"
        register(nib, forCellWithReuseIdentifier: identifier)
    }

    func registerClassCell<T>(_ cellType: T.Type) where T: UICollectionViewCell {
        let identifier = "\(cellType)"
        register(cellType, forCellWithReuseIdentifier: identifier)
    }

    func dequeueReusable<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
    
    func dequeueReusableCollectionViewCell<T: UICollectionViewCell>(_ cell: T.Type,
                                             for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as! T
        return cell
    }
}
