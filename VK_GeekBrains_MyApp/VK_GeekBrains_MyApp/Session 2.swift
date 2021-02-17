//
//  SessionMyApp.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 31.01.2021.
//

import Foundation

struct Session {
    
    static var shared = Session()
    
    var token: String?
    var userID: Int?
    
    private init() {}
}
