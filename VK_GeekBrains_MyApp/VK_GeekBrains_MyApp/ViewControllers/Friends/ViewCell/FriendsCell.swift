//
//  FriendsCell.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 18.01.2021.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var avatar: CustomView!{ didSet{
        self.avatar.layer.cornerRadius = self.avatar.frame.width/2
    }}
    @IBOutlet weak var name: UILabel!
    
}
