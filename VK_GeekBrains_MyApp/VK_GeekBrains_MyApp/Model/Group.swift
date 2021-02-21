//
//  Group.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit
import RealmSwift

class Group: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var icon: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon = "photo_100"
    }
}


