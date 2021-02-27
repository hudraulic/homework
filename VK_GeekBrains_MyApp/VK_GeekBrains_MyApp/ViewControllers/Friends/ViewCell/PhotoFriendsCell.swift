//
//  PhotoFriendsCell.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 18.01.2021.
//

import UIKit

class PhotoFriendsCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!{ didSet{
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 8
        
    }}
    
}
