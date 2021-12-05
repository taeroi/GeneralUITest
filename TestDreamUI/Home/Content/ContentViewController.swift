//
//  ContentViewController.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import Foundation
import UIKit

final class ContentViewController: BaseViewController {
    
    
    // ===== UI =====
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(indexPath: IndexPath) {
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = "\(indexPath)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    //MARK: - Setup Views
    
    override func setupViews() {
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
     
    }
}
