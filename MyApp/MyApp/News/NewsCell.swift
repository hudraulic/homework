//
//  NewsCell.swift
//  MyApp
//
//  Created by Владислав Капиносов on 04.01.2021.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var customView: CustomView! {didSet{
        self.customView.layer.cornerRadius = self.customView.frame.width/2
        }
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var discLabel: UILabel!
    
    @IBOutlet weak var imageNews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
