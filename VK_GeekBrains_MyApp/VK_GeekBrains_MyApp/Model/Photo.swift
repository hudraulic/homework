//
//  Photo.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 15.02.2021.
//

import UIKit
import RealmSwift

class Photo: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var ownerID: Int
    var sizes: [Size]
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
}

struct Size: Codable {
    var type: String
    let url: String
}
