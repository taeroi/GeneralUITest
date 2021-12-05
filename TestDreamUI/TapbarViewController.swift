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
        
        delegate = self
    }
    
    
    private func setupTabbar() {
        tabBar.backgroundColor = .white
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            setTabbarAppearanceColor(appearance.compactInlineLayoutAppearance)
            setTabbarAppearanceColor(appearance.inlineLayoutAppearance)
            setTabbarAppearanceColor(appearance.stackedLayoutAppearance)
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
            
        } else {
            tabBar.barTintColor = .black
            tabBar.unselectedItemTintColor = .lightGray
        }
    }
    
    @available(iOS 15.0, *)
    private func setTabbarAppearanceColor(_ appearance: UITabBarItemAppearance) {
        appearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.focused.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        appearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        
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


extension TapbarViewController: UITabBarControllerDelegate {
    
}
