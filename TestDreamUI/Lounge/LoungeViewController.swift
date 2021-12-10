//
//  LoungeViewController.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import Foundation
import UIKit

final class LoungeViewController: BaseViewController   {
 
    
    // ===== UI =====
    private var tableView = UITableView(frame: .zero, style: .grouped)
    
    // ===== Properties =====
    // --- Header ---
    private let threeContentHeaderId = "threeContentHeaderId"
    private let oneContentHeaderId = "oneContentHeaderId"
    private let conceptViewerHeaderId = "conceptViewerHeaderId"
    // --- Cell ---
    private let threeContentCellId = "threeContentCellId"
    private let oneContentCellId = "oneContentCellId"
    private let conceptViewerCellId = "conceptViewerCellId"
    
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "lounge"
        
        registerTableView()
    }
    
    
    //MARK: - Setup Views
    
    override func setupViews() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func registerTableView() {
        tableView.alwaysBounceVertical = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ThreeContentHeader.self, forHeaderFooterViewReuseIdentifier: threeContentHeaderId)
        tableView.register(OneContentHeader.self, forHeaderFooterViewReuseIdentifier: oneContentHeaderId)
        tableView.register(ConceptViewerHeader.self, forHeaderFooterViewReuseIdentifier: conceptViewerHeaderId)
        
        tableView.register(ThreeContentCell.self, forCellReuseIdentifier: threeContentCellId)
        tableView.register(OneContentCell.self, forCellReuseIdentifier: oneContentCellId)
        tableView.register(ConceptViewerCell.self, forCellReuseIdentifier: conceptViewerCellId)
    }
    
}


//MARK: - DataSource & Delegate

extension LoungeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: threeContentCellId, for: indexPath)
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


//MARK: - Header

extension LoungeViewController {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? ThreeContentHeader else { return }
        headerView.setTitle("제목")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.dequeueReusableHeaderFooterView(withIdentifier: threeContentHeaderId) as? ThreeContentHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
