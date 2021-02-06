//
//  SessionMyApp.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 31.01.2021.
//

import Foundation

struct SessionMyApp {
    
    static var shared = SessionMyApp()
    
    var token: String?
    var userID: Int?
    
    private init() {}
}
