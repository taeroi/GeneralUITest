//
//  NavigationPushable.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/05.
//

import Foundation
import UIKit

protocol NavigationPushable: NSObject {
    func selected(at indexPath: IndexPath)
}
