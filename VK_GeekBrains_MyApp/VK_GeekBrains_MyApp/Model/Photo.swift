//
//  Photo.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 15.02.2021.
//

import UIKit
import RealmSwift

class Photo: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
    var sizes = List<Size>()
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    override static func indexedProperties() -> [String] {
        return ["ownerID"]
    }

}

class Size: Object, Codable {
    @objc dynamic var type: String
    @objc dynamic var url: String
}
