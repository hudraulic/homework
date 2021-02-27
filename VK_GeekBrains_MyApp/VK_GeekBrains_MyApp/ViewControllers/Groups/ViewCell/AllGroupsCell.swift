//
//  AllGroupsCell.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var icon: CustomView!{ didSet{
        self.icon.layer.cornerRadius = self.icon.frame.width/2
    }}
    @IBOutlet weak var nameGroup: UILabel!
    
}
