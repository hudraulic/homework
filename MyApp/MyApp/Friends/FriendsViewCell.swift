//
//  FriendsViewCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 13.12.2020.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var customView: CustomView!{ didSet{
        self.customView.layer.cornerRadius = self.customView.frame.width/2
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
}

