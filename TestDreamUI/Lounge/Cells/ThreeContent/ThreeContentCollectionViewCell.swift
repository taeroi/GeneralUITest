//
//  ThreeContentCollectionViewCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import UIKit

protocol ButtonTouchable: AnyObject {
    func handleDownloadButtonTapped(_ cell: ThreeContentCollectionViewCell)
}

final class ThreeContentCollectionViewCell: BaseCollectionViewCell {
    
    // ===== Model =====
    var model: ThreeContentModel! {
        didSet {
//            iconImageView.image = UIImage(named: model.coverImageName)
            nameLabel.text = model.name
            descriptionLabel.text = model.description
        }
    }
    
    // ===== UI =====
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let getButton = CustomButton(
        "Get",
        font: .systemFont(ofSize: 13, weight: .bold),
        titleColor: .systemBlue,
        backgroundColor: .lightGray
    )
    lazy var bottomLineView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // ===== Properties ======
    weak var delegate: ButtonTouchable?
    var getButtonTap: UITapGestureRecognizer!

    
    //MARK: - Setup Subviews
    
    override func setupSubviews() {
        
        contentView.addSubview(iconImageView)
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        
        contentView.addSubview(getButton)
        getButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        getButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        getButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        getButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        getButton.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(bottomLineView)
        bottomLineView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8).isActive = true
        bottomLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bottomLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomLineView.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
    }
    
}


//MARK: - Tap Gesture

extension ThreeContentCollectionViewCell {
    
    func connectGesture() {
        getButtonTap = UITapGestureRecognizer(target: self, action: #selector(handleGetButtonTapped))
        getButton.addGestureRecognizer(getButtonTap)
    }
    
    func disconnectGesture() {
        getButton.removeGestureRecognizer(getButtonTap)
        getButtonTap = nil
    }
    
    
    @objc
    func handleGetButtonTapped() {
        delegate?.handleDownloadButtonTapped(self)
    }
    
}
