//
//  OneContentHeader.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/10.
//

import UIKit

final class OneContentHeader: UITableViewHeaderFooterView {
    
    var presentAction: (() -> ())?
    
    // ===== UI =====
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let userIconButton: UIButton = {
        let button = UIButton()
//        button.setImage(#imageLiteral(resourceName: "square.and.arrow.up"), for: .normal)
//        button.setImage(#imageLiteral(resourceName: "square.and.arrow.up"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = DefaultConstants.shared.lounge.iconBorderColor
        button.layer.borderWidth =  DefaultConstants.shared.lounge.iconBorderWidth
        button.layer.cornerRadius = DefaultConstants.shared.lounge.iconCornerRadius
        return button
    }()
    
    
    // ===== Properties =====
    var userImageTap: UITapGestureRecognizer!
    
    
    //MARK: - Setup Views
    
    private func setupViews() {
        layer.masksToBounds = true
        
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        addSubview(userIconButton)
        userIconButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userIconButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        userIconButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        userIconButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setTitle(_ text: String) {
        titleLabel.text = text
    }
    
}


//MARK: - Tap Gesture

extension OneContentHeader {
    
    func connectGesture() {
        userImageTap = UITapGestureRecognizer(target: self, action: #selector(presentViewController))
        userIconButton.addGestureRecognizer(userImageTap)
    }
    
    func disconnectGesture() {
        userIconButton.removeGestureRecognizer(userImageTap)
        userImageTap = nil
    }
    
    
    @objc
    func presentViewController() {
        presentAction?()
    }
    
}

