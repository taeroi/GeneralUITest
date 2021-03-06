//
//  CustomButton.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/09.
//

import UIKit

class CustomButton: UIView {

    //===== Components =====
    
    private let label = UILabel()

    
    //MARK: - Initializer
    
    convenience init(_ title: String? = nil,
                     font: UIFont = .systemFont(ofSize: 13),
                     titleColor: UIColor = .black,
                     backgroundColor: UIColor = .purple) {
        self.init(frame: .zero)
        
        self.label.text = title
        self.label.textColor = titleColor
        self.backgroundColor = backgroundColor
        
        setupViews()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup Views
    
    private func setupViews() {
        self.layer.cornerRadius = 10
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setTitle(_ text: String) {
        label.text = text
    }
    
    func setColor(_ textColor: UIColor = .black,
                  _ backgroundColor: UIColor = .white) {
        self.label.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
}
