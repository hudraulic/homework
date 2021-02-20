//
//  Responce.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.02.2021.
//

import Foundation

struct Response<T: Codable>: Codable {
    let response: Items<T>
}
struct Items<T: Codable>: Codable {
    let items: [T]
}
struct ResponseJoin: Codable {
    let response: Int
}
