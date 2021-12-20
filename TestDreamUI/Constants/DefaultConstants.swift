//
//  DefaultConstants.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import Foundation
import UIKit


final class DefaultConstants: NSObject {
    
    // ===== Shared =====
    static let shared = DefaultConstants()
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    
    
    // ===== Lounge =====
    private(set) var lounge = LoungeConstants()
    
    class LoungeConstants: NSObject {
        
        let leftMargin: CGFloat = 20
        
        let iconBorderColor: CGColor = UIColor(red: 239/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1).cgColor
        let iconBorderWidth: CGFloat = 0.8
        let iconCornerRadius: CGFloat = 17.5
            
        //===== Cell Height =====
        let oneContentCellHeight: CGFloat = 336
        let threeContentCellHeight: CGFloat = 282
        let quickViewerCellHeight: CGFloat = 312
        let quickViewerInnerCellHeight: CGFloat = 45
        
        //===== Header Height =====
        let oneContentHeaderHeight: CGFloat = 80
        let defaultContentHeaderHeight: CGFloat = 45
    }
    
   
}

