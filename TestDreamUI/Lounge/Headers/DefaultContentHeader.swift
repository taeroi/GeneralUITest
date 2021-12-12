//
//  ThreeContentHeader.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import UIKit

class DefaultContentHeader: UITableViewHeaderFooterView {
    
    
    // ===== UI =====
    private lazy var topLine: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let seeAllButton = CustomButton(
        "See All",
        font: .systemFont(ofSize: 12, weight: .bold),
        titleColor: .white,
        backgroundColor: .systemMint
    )
    
    
    //MARK: - Setup Views
    
    private func setupViews() {
        layer.masksToBounds = true
        
        addSubview(topLine)
        topLine.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        topLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        topLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        addSubview(seeAllButton)
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        seeAllButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        seeAllButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
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
