//
//  DatabaseGroups.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 26.02.2021.
//

import Foundation
import RealmSwift

class DatabaseGr {
    private var database: Realm?
    
    init() {
        database = try? Realm()
        //print(database?.configuration.fileURL)
    }
    
    func write(_ object: Group) {
        do {
            database?.beginWrite()
            database?.add(object, update: .all)
            try database?.commitWrite()
        } catch {
            print("something wrong")
        }
    }
    
    func read() -> [Group]? {
        if let objects = database?.objects(Group.self) {
            return Array(objects)
        }
        return nil
    }
}
