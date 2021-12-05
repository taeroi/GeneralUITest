//
//  TapbarViewController.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import Foundation
import UIKit


final class TapbarViewController: UITabBarController {
    
    typealias TabInformation = (title: String, image: String?)

    fileprivate var tabInformations: [TabInformation] = [TabInformation(title: "home", image: nil),
                                                         TabInformation(title: "lounge", image: nil),
                                                         TabInformation(title: "my", image: nil)]
   
    
    //MARK: - Setup Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbar()
        setupViewControllers()
    }
    
    
    private func setupTabbar() {
        tabBar.backgroundColor = .white
    }
    
    private func setupViewControllers() {
        
        let vcList = [UINavigationController(rootViewController: HomeViewController()),
                      UINavigationController(rootViewController: LoungeViewController()),
                      UINavigationController(rootViewController: MyViewController())]
        
        for (index, vc) in vcList.enumerated() {
            vc.tabBarItem.image = UIImage(named: tabInformations[index].image ?? "")
            vc.tabBarItem.title = tabInformations[index].title
        }
        
        viewControllers = vcList
    }
    
}
