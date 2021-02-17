//
//  PhotoView.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class PhotoView: UIControl {

    private var imageView = UIImageView()
    private var imageView1 = UIImageView()
    private var imageView2 = UIImageView()
    private var imageView3 = UIImageView()
    private var imageView4 = UIImageView()
    
    func setImages(_ photos: [UIImage?] = []) {
        guard !photos.isEmpty else {return}
        
        if photos.count > 3 {
            imageView1.contentMode = .scaleToFill
            imageView2.contentMode = .scaleToFill
            imageView3.contentMode = .scaleToFill
            imageView4.contentMode = .scaleToFill
            addSubview(imageView1)
            addSubview(imageView2)
            addSubview(imageView3)
            addSubview(imageView4)

            imageView1.translatesAutoresizingMaskIntoConstraints = false
            imageView2.translatesAutoresizingMaskIntoConstraints = false
            imageView3.translatesAutoresizingMaskIntoConstraints = false
            imageView4.translatesAutoresizingMaskIntoConstraints = false
            
            imageView1.image = photos[0]
            imageView2.image = photos[1]
            imageView3.image = photos[2]
            imageView4.image = photos[3]
            

            NSLayoutConstraint.activate([
                imageView1.topAnchor.constraint(equalTo: self.topAnchor),
                imageView1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                imageView1.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                imageView1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -bounds.width/4),

                imageView2.topAnchor.constraint(equalTo: self.topAnchor),
                imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor),
                imageView2.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                imageView2.heightAnchor.constraint(equalToConstant: bounds.height/3),

                imageView3.topAnchor.constraint(equalTo: imageView2.bottomAnchor),
                imageView3.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor),
                imageView3.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                imageView3.heightAnchor.constraint(equalToConstant: bounds.height/3),
                
                imageView4.topAnchor.constraint(equalTo: imageView3.bottomAnchor),
                imageView4.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor),
                imageView4.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                imageView4.heightAnchor.constraint(equalToConstant: bounds.height/3)
                
            ])
        } else {
            imageView.contentMode = .scaleToFill
            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = photos[0]

            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: self.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        }
    }
    
//    private var imageView = UIImageView()
//    private var collageView1 = UIImageView()
//    private var collageView2 = UIImageView()
//    private var collageView3 = UIImageView()
//    private var collageView4 = UIImageView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setImages()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.setImages()
//    }
//    func setImages(photos: [UIImage?] = []){
//        guard !photos.isEmpty else { return }
//        if photos.count > 3 {
//            addSubview(collageView1)
//            addSubview(collageView2)
//            addSubview(collageView3)
//            addSubview(collageView4)
//            collageView1.translatesAutoresizingMaskIntoConstraints = false
//            collageView2.translatesAutoresizingMaskIntoConstraints = false
//            collageView3.translatesAutoresizingMaskIntoConstraints = false
//            collageView4.translatesAutoresizingMaskIntoConstraints = false
//            
//            collageView1.image = photos[0]
//            collageView2.image = photos[1]
//            collageView3.image = photos[2]
//            collageView4.image = photos[3]
//            
//            NSLayoutConstraint.activate([
//                collageView1.topAnchor.constraint(equalTo: topAnchor),
//                collageView1.leadingAnchor.constraint(equalTo: leadingAnchor),
//                collageView1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -frame.width/4),
//                collageView1.bottomAnchor.constraint(equalTo: bottomAnchor),
//                
//                collageView2.topAnchor.constraint(equalTo: topAnchor),
//                collageView2.leadingAnchor.constraint(equalTo: collageView1.trailingAnchor),
//                collageView2.trailingAnchor.constraint(equalTo: trailingAnchor),
//                collageView2.heightAnchor.constraint(equalToConstant: frame.height/3),
//                
//                collageView3.topAnchor.constraint(equalTo: collageView2.bottomAnchor),
//                collageView3.leadingAnchor.constraint(equalTo: collageView1.trailingAnchor),
//                collageView3.trailingAnchor.constraint(equalTo: trailingAnchor),
//                collageView3.heightAnchor.constraint(equalToConstant: frame.height/3),
//                
//                collageView4.topAnchor.constraint(equalTo: collageView3.bottomAnchor),
//                collageView4.leadingAnchor.constraint(equalTo: collageView1.trailingAnchor),
//                collageView4.trailingAnchor.constraint(equalTo: trailingAnchor),
//                collageView4.heightAnchor.constraint(equalToConstant: frame.height/3)
//            ])
//        } else {
//            addSubview(imageView)
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            
//            imageView.image = photos[0]
//            
//            NSLayoutConstraint.activate([
//                imageView.topAnchor.constraint(equalTo: topAnchor),
//                imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
//            ])
//            
//        }
//    }

}
