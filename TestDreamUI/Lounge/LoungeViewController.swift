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
        
        tableView.registerClassHeaderFooterView(OneContentHeader.self)
        tableView.registerClassHeaderFooterView(ThreeContentHeader.self)
        tableView.registerClassHeaderFooterView(ConceptViewerHeader.self)
        
        tableView.registerClassCell(ThreeContentCell.self)
        tableView.registerClassCell(OneContentCell.self)
        tableView.registerClassCell(QuickViewerCell.self)
    }
    
}


//MARK: - UI Action


extension LoungeViewController {
    
    private func pushToDetailViewController(_ indexPath: IndexPath) {
        let loungeDetailVC = LoungeDetailViewController(indexPath: indexPath)
        navigationController?.pushViewController(loungeDetailVC, animated: true)
    }
    
    private func presentUserInfoViewController() {
        let userInfoVC = LoungeUserInfoViewController()
        navigationController?.present(userInfoVC, animated: true)
    }
    
}


//MARK: - CollectionView Setup

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
            cell.pushAction = { [weak self] innerContentindexPath in
                self?.pushToDetailViewController(innerContentindexPath)
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusable(ThreeContentCell.self, for: indexPath)
            cell.pushAction = { [weak self] innerContentindexPath in
                self?.pushToDetailViewController(innerContentindexPath)
            }
            cell.pressedGetButtonAction = { [weak self] model in
               print("Get :: \(model)")
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
        switch indexPath.section {
        case 0:
            return LoungeConstants.oneContentCellHeight
        case 1:
            return LoungeConstants.threeContentCellHeight
        case 2:
            return LoungeConstants.quickViewerCellHeight
        default:
            return 0
        }
    }
    
}


//MARK: - CollectionView Header

extension LoungeViewController {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let headerView = tableView.dequeueReusableHeaderFooterView(OneContentHeader.self)
            headerView.setTitle("First Title")
            headerView.presentClouser = { [weak self] in
                self?.presentUserInfoViewController()
            }
            return headerView
        case 1:
            let headerView = tableView.dequeueReusableHeaderFooterView(ThreeContentHeader.self)
            return headerView
        case 2:
            let headerView = tableView.dequeueReusableHeaderFooterView(ThreeContentHeader.self)
            return headerView
        default:
            let headerView = tableView.dequeueReusableHeaderFooterView(ThreeContentHeader.self)
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
}
