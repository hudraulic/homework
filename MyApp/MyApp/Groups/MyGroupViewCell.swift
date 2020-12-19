//
//  MyGroupViewCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class MyGroupViewCell: UITableViewCell {

    @IBOutlet weak var iconGroup: UIImageView!
    @IBOutlet weak var nameGroup: UILabel!
    
    func setData(name: String, image: UIImage) {
        iconGroup.image = image
        nameGroup.text = name
    }
}
