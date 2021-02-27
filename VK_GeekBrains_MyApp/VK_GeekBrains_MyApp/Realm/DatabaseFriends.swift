//
//  DataBaseFriends.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 24.02.2021.
//

import Foundation
import RealmSwift

class DatabaseFr {
    private var database: Realm?
    
    init() {
        database = try? Realm()
        //print(database?.configuration.fileURL)
    }
    
    func write(_ object: Users) {
        do {
            database?.beginWrite()
            database?.add(object, update: .all)
            try database?.commitWrite()
        } catch {
            print("something wrong")
        }
    }
    
    func read() -> [Users]? {
        if let objects = database?.objects(Users.self) {
            return Array(objects)
        }
        return nil
    }
}
