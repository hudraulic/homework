//
//  FriendsViewCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 13.12.2020.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setData(name: String, image: UIImage) {
        nameLabel.text = name
        logoImage.image = image
    }
}
