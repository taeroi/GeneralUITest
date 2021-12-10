//
//  ConceptViewerHeader.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/10.
//

import UIKit

final class ConceptViewerHeader: UITableViewHeaderFooterView {
    
    private func setupViews() {
        
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

