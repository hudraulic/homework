//
//  ImageService.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.02.2021.
//

import UIKit

class ImageServise {
    
    //Функция для установки backgroundImage для View
    func setBackgroundView(_ location: UIView) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "IMG_6077")
        backgroundImage.contentMode = .scaleAspectFill
        location.insertSubview(backgroundImage, at: 0)
    }
    //Функция для получения иконок или аватарок
    func getImage(urlStr: String, onComplete: @escaping ((Data) -> Void)) {
        guard let url = URL(string: urlStr) else {return}
        
        if let data = try? Data(contentsOf: url) {
            onComplete(data)
        }
    }
}
