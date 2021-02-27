//
//  NewsViewCell.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class NewsViewCell: UITableViewCell {

    @IBOutlet weak var icon: CustomView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var disk: UILabel!
    
    @IBOutlet weak var photoView: PhotoView!{didSet{
        photoView.backgroundColor = .clear
    }}
}
