//
//  PhotoFriendsViewCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class PhotoFriendsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoFriends: UIImageView!{ didSet{
        photoFriends.contentMode = .scaleAspectFill
        photoFriends.layer.cornerRadius = 8
    }}
    
    func setData(photo: UIImage) {
        photoFriends.image = photo
    }
}
