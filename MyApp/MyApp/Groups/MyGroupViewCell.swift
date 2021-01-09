//
//  MyGroupViewCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class MyGroupViewCell: UITableViewCell {

    @IBOutlet weak var customView: CustomView!{ didSet{
        self.customView.layer.cornerRadius = self.customView.frame.width/2
        }
    }
    @IBOutlet weak var nameGroup: UILabel!
    
}
