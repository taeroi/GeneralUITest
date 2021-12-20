//
//  MyViewController.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//


import UIKit


final class MyViewController: BaseViewController {


    // ===== Properties =====
    
    private let tableViewTopInset: CGFloat = 200
    private let topImageViewHeight: CGFloat = 288
    lazy var alphaChangeProgress: CGFloat = {
        return hasTopNotch() ? 112 : 84
    }()
    lazy var statusBarHeight: CGFloat = {
        return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }()
    lazy var navigationBarHeight: CGFloat = {
        return statusBarHeight + 44
    }()
    lazy var originalContentOffSetY: CGFloat = {
       return tableViewTopInset + navigationBarHeight
    }()

    
    // ===== UI ======
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(
            x: 0,
            y: -statusBarHeight,
            width: DefaultConstants.shared.screenWidth,
            height: DefaultConstants.shared.screenHeight + statusBarHeight
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(
            top: tableViewTopInset,
            left: 0,
            bottom: 0,
            right: 0
        )
        tableView.separatorInset = UIEdgeInsets(
            top: 0,
            left: DefaultConstants.shared.my.leftMargin,
            bottom: 0,
            right: DefaultConstants.shared.my.leftMargin
        )
        tableView.registerClassCell(MyTopInfoCell.self)
        tableView.registerClassCell(MyStoryCell.self)
        tableView.registerClassCell(MyContentCell.self)
        return tableView
    }()

    lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "my_sample_image6")
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(
            x: 0,
            y: -(topImageViewHeight),
            width: DefaultConstants.shared.screenWidth,
            height: topImageViewHeight
        )
        imageView.layer.masksToBounds = true
        return imageView
    }()


    //MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - Setup Views
    
    override func setupViews() {
        tableView.addSubview(topImageView)
        view.addSubview(tableView)
    }

}


//MARK: - Setup TableView

extension MyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusable(MyTopInfoCell.self, for: indexPath)
        case 1:
            let cell = tableView.dequeueReusable(MyStoryCell.self, for: indexPath)
            cell.pushAction = { [weak self] cellIndexPath in
                print("story model :: ", cellIndexPath)
            }
            return cell
        case 2:
            return tableView.dequeueReusable(MyContentCell.self, for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
}

extension MyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return 100
        case 2:
            return 500
        default:
            return 0
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        var offSetY = scrollView.contentOffset.y
    
        print("offSet Y :: ", offSetY)
        
        // topImageView의 frame을 바꿔요
        if offSetY < -originalContentOffSetY {
            topImageView.frame.origin.y = offSetY - (hasTopNotch() ? 44 : 64)
            topImageView.frame.size.height = -(offSetY - (hasTopNotch() ? 44 : 64))
        }

        // offsetY을 통해 알파가 0에서 1인지 확인해요
        if offSetY > -(originalContentOffSetY - alphaChangeProgress) {
            offSetY = -(originalContentOffSetY - alphaChangeProgress)
        } else if offSetY < -originalContentOffSetY {
            offSetY = -originalContentOffSetY
        }
    }
    
}

extension MyViewController {

    ///디바이스가 노치가 있는지 없는지 확인해요
    func hasTopNotch()-> Bool {
        if #available(iOS 11.0, *) {
            let top = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0
            return top < CGFloat(24) ? false : true
        } else {
            return false
        }
    }

}
