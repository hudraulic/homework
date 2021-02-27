//
//  DatabasePhoto.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 27.02.2021.
//

import Foundation
import RealmSwift

class DatabasePh {
    
    private var database: Realm?
    
    init() {
        database = try? Realm()
        //print(database?.configuration.fileURL)
    }
    
    func write(_ object: [Photo]){
        do {
            let old = database?.objects(Photo.self)
            self.database?.beginWrite()
            self.database?.delete(old!)
            self.database?.add(object, update: .modified)
            try self.database?.commitWrite()
        } catch {
            print(error)
        }
    }
    
    func read() -> [Photo]? {
        if let objects = database?.objects(Photo.self) {
            return Array(objects)
        }
        return nil
    }
}
