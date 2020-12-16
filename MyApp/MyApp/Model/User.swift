//
//  User.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class Users {
    
    let name: String
    let image: UIImage
    
    init(name: String, image: UIImage) {
        self.image = image
        self.name = name
    }
}

let vlad = Users(name: "Vlad", image: UIImage(named: "Vlad")!)
let jonh = Users(name: "Jonh", image: UIImage(named: "Jonh")!)
let anton = Users(name: "Anton", image: UIImage(named: "Anton")!)
