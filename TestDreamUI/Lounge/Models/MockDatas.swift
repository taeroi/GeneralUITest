//
//  MockDatas.swift
//  TestDreamUI
//
//  Created by 박태환 on 2021/12/12.
//

import Foundation


//MARK: - One Conetnt View's Mock Data

 let OneContentDataResource: [OneContentModel] = [
    OneContentModel(
        feature: "MAJOR UPDATE",
        name: "Mock 1",
        description: "Cards",
        coverImageName: "cover_1"
    ),
    
    OneContentModel(
        feature: "NEW GAME",
        name: "Mock 2",
        description: "Strategy",
        coverImageName: "cover_2"
    ),
    
    OneContentModel(
        feature: "REDISCOVER THIS",
        name: "Mock 3",
        description: "Adventure",
        coverImageName: "cover_3"
    )
]


//MARK: - Three Conetnt View's Mock Data

let ThreeContentDataResource: [ThreeContentModel] = [
    ThreeContentModel(
        name: "Mock 1",
        description: "Casual",
        iconImageName: "logo_broadcast"
    ),
    ThreeContentModel(
        name: "Mock 2",
        description: "Strategy",
        iconImageName: "logo_car"
    ),
    ThreeContentModel(
        name: "Mock 3",
        description: "Card",
        iconImageName: "logo_jump"
    ),
    ThreeContentModel(
        name: "Mock 4",
        description: "Role-Playing",
        iconImageName: "logo_smile"
    ),
    ThreeContentModel(
        name: "Mock 5",
        description: "A musical journey awaits",
        iconImageName: "logo_weibo"
    )
]


//MARK: - QuickViewerInner View's Mock Data

let mockTableViewCellID = "mockTableViewCellID"
let QuickViewerInnerMockDataResource: [String] = [
    "Mock 1",
    "Mock 2",
    "Mock 3",
    "Mock 4",
    "Mock 5",
    "Mock 6",
]
