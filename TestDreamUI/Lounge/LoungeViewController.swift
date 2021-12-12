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
        
        tableView.registerClassCell(ThreeContentCell.self)
        tableView.registerClassCell(OneContentCell.self)
        tableView.registerClassCell(QuickViewerCell.self)

        tableView.register(ThreeContentHeader.self, forHeaderFooterViewReuseIdentifier: threeContentHeaderId)
        tableView.register(OneContentHeader.self, forHeaderFooterViewReuseIdentifier: oneContentHeaderId)
        tableView.register(ConceptViewerHeader.self, forHeaderFooterViewReuseIdentifier: conceptViewerHeaderId)
    }
    
    
    //MARK: - UI Action
    
    private func pushToDetailViewController(_ indexPath: IndexPath) {
        let loungeDetailVC = LoungeDetailViewController(indexPath: indexPath)
        navigationController?.pushViewController(loungeDetailVC, animated: true)
    }
    
}


//MARK: - DataSource & Delegate

extension LoungeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusable(OneContentCell.self, for: indexPath)
            cell.pushClosure = { [weak self] innerContentindexPath in
                self?.pushToDetailViewController(innerContentindexPath)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusable(ThreeContentCell.self, for: indexPath)
            cell.pushClosure = { [weak self] innerContentindexPath in
                self?.pushToDetailViewController(innerContentindexPath)
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusable(QuickViewerCell.self, for: indexPath)
            cell.pushClosure = { [weak self] innerContentindexPath in
                self?.pushToDetailViewController(innerContentindexPath)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return LoungeConstants.oneContentCellHeight
        } else if indexPath.section == 1 {
            return LoungeConstants.ThreeContentCellHeight
        } else if indexPath.section == 2 {
            return LoungeConstants.QuickViewerCellHeight
        }
        return 0
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
