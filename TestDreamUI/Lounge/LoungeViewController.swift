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
    private let loungeHeaderId = "loungeHeaderId"
    private let loungeCellId = "loungeCellId"
    
    
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
        
        tableView.register(OneContentCell.self, forHeaderFooterViewReuseIdentifier: loungeHeaderId)
        tableView.register(ThreeContentCell.self, forCellReuseIdentifier: loungeCellId)
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
        tableView.dequeueReusableCell(withIdentifier: loungeCellId, for: indexPath)
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


//MARK: - Header

extension LoungeViewController {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? OneContentCell else { return }
        headerView.setTitle("제목")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.dequeueReusableHeaderFooterView(withIdentifier: loungeHeaderId) as? OneContentCell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}
