//
//  User.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class Users {
    
    let name: String
    let userPhoto: UIImage
    let userPhotoLibrari: [UIImage]
    
    init(name: String, userPhoto: UIImage, librariPhoto: [UIImage]) {
        self.name = name
        self.userPhoto = userPhoto
        self.userPhotoLibrari = librariPhoto
    }
}


