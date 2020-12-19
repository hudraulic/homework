//
//  PhotoFriendsViewCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class PhotoFriendsViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoFriends: UIImageView!
    
    func setData(photo: UIImage) {
        photoFriends.image = photo
    }
}
