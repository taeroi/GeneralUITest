//
//  LoungeHeaderView.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import UIKit

class LoungeHeaderView: UITableViewHeaderFooterView {
    
    
    // ===== UI =====
    private lazy var topLine: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Setup Views
    
    private func setupViews() {
        layer.masksToBounds = true
        contentView.backgroundColor = .green
        
        addSubview(topLine)
        topLine.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        topLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        topLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        addSubview(button)
        button.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    
    func setTitleAndButton(_ text: String, _ buttonTitle: String) {
        titleLabel.text = text
        button.setTitle(buttonTitle, for: .selected) 
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
