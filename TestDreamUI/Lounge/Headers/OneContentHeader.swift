//
//  OneContentHeader.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/10.
//

import UIKit

final class OneContentHeader: UITableViewHeaderFooterView {
    
    var presentClouser: (() -> ())?
    
    // ===== UI =====
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let userButton: UIButton = {
        let button = UIButton()
//        button.setImage(#imageLiteral(resourceName: "square.and.arrow.up"), for: .normal)
//        button.setImage(#imageLiteral(resourceName: "square.and.arrow.up"), for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = LoungeConstants.iconBorderColor
        button.layer.borderWidth =  LoungeConstants.iconBorderWidth
        button.layer.cornerRadius = LoungeConstants.iconCornerRadius
        button.addTarget(self, action: #selector(presentViewController), for: .touchUpInside)
        return button
    }()
    
    @objc
    func presentViewController() {
        presentClouser?()
    }
    
    
    //MARK: - Setup Views
    
    private func setupViews() {
        layer.masksToBounds = true
        
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        addSubview(userButton)
        userButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
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

