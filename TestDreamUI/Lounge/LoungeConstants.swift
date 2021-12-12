//
//  LoungeConstants.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import Foundation
import UIKit

let screenHeight = UIScreen.main.bounds.size.height
let screenWidth = UIScreen.main.bounds.size.width

enum LoungeConstants {
    
    static let leftMargin: CGFloat = 20
    
    static let iconBorderColor: CGColor = UIColor(red: 239/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1).cgColor
    static let iconBorderWidth: CGFloat = 0.8
    static let iconCornerRadius: CGFloat = 17.5
        
    //===== Cell Height =====
    static let oneContentCellHeight: CGFloat = 336
    static let threeContentCellHeight: CGFloat = 282
    static let quickViewerCellHeight: CGFloat = 312
    static let quickViewerInnerCellHeight: CGFloat = 45
    
    //===== Header Height =====
    static let oneContentHeaderHeight: CGFloat = 80
    static let defaultContentHeaderHeight: CGFloat = 45
}

