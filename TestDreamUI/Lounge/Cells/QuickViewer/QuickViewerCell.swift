//
//  QuickViewerCell.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/10.
//

import UIKit

final class QuickViewerCell: BaseTableViewCell {

    var pushClosure: ((_ indexPath: IndexPath)->())?
    
    
    //===== UI =====
    private lazy var innerTableView: QuickViewerInnerTableView = {
        let frame = CGRect(
            x: 0,
            y: 42,
            width: screenWidth,
            height: LoungeConstants.quickViewerCellHeight * CGFloat(QuickViewerInnerMockDataResource.count)
        )
        let tableView = QuickViewerInnerTableView(frame: frame, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func setupSubviews() {
        contentView.addSubview(innerTableView)
        backgroundColor = .white
    }
    
}


//MARK: - TableView Setup

extension QuickViewerCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard tableView == innerTableView else { return 0 }
        return QuickViewerInnerMockDataResource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard tableView == innerTableView else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: mockTableViewCellID, for: indexPath)
        cell.textLabel?.text = QuickViewerInnerMockDataResource[indexPath.row]
        cell.textLabel?.textColor = .systemBlue
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushClosure?(indexPath)
    }
    
}
