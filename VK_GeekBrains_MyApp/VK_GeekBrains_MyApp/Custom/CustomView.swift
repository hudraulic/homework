//
//  CustomView.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 18.01.2021.
//

import UIKit

class CustomView: UIControl {

    var imageView: UIImageView? = nil
    
    func setImage(_ image: UIImage) {
        imageView = UIImageView(frame: self.bounds)
        imageView?.image = image
        imageView?.layer.cornerRadius = self.frame.size.width/2
        imageView?.contentMode = .scaleAspectFill
        imageView?.layer.masksToBounds = true
        self.backgroundColor = .clear
        button.addSubview(imageView!)
        
    }

    override func draw(_ rect: CGRect) {
        //настройки тени
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 0)
    }
    
    let button = UIButton(type: .custom)
    
    func setButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = self.frame.size.width/2
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(button)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setButton()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.frame = bounds
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setButton()
    }
    
    @objc func tap() {
        UIView.animate(
            withDuration: 0.1,
            delay: 0.0,
            options: [],
            animations: {
                self.button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }) { (_) in
            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.5,
                options: .curveEaseIn,
                animations: {
                    self.button.transform = CGAffineTransform.identity
                },
                completion: nil)
        }
    }
}
