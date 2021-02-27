//
//  PresentPhotoViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class PresentPhotoViewController: UIViewController {

    var photos: [Photo] = []
    var selectedPhoto = 0
    var imageView: UIImageView! = nil
    var swipeToRight: UIViewPropertyAnimator!
    var swipeToLeft: UIViewPropertyAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageServise().setBackgroundView(self.view)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .black
        let gestPan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        view.addGestureRecognizer(gestPan)
        setImage()
        startAnimate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func setImage() {
        var indexPhoto2 = selectedPhoto + 1
        var indexPhoto1 = selectedPhoto - 1
        let indexPhoto = selectedPhoto
        
        if indexPhoto1 < 0 {
            indexPhoto1 = photos.count - 1
        }
        if indexPhoto2 > photos.count - 1 {
            indexPhoto2 = 0
        }
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 4/3),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        let url = photos[indexPhoto].sizes[indexPhoto].url
        ImageServise().getImage(urlStr: url) { (data) in
            let photo = UIImage(data: data)
            self.imageView.image = photo
        }
        
        self.imageView.layer.cornerRadius = 8
        self.imageView.clipsToBounds = true
    
        let scale = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.imageView.alpha = 0
        self.imageView.transform = scale
        
    }
    
    func startAnimate(){
        setImage()
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: { [unowned self] in
                self.imageView.transform = .identity
                self.imageView.alpha = 1
            })
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            swipeToRight = UIViewPropertyAnimator(
                duration: 0.3,
                curve: .easeInOut,
                animations: {
                    UIView.animate(
                        withDuration: 0.1,
                        delay: 0,
                        options: [],
                        animations: { [unowned self] in
                            self.imageView.transform = CGAffineTransform(translationX: self.view.bounds.maxX - 40, y: 0)
                            self.imageView.alpha = 0
                    }, completion: { [unowned self] _ in
                        self.selectedPhoto -= 1
                        if self.selectedPhoto < 0 {
                            self.selectedPhoto = self.photos.count - 1
                        }
                        self.startAnimate()
                    })
            })
            swipeToLeft = UIViewPropertyAnimator(
                duration: 0.3,
                curve: .easeInOut,
                animations: {
                    UIView.animate(
                        withDuration: 0.1,
                        delay: 0,
                        options: [],
                        animations: { [unowned self] in
                            self.imageView.transform = CGAffineTransform(translationX: -self.view.bounds.maxX + 40, y: 0)
                            self.imageView.alpha = 0
                    }, completion: { [unowned self] _ in
                        self.selectedPhoto += 1
                        if self.selectedPhoto > self.photos.count - 1 {
                            self.selectedPhoto = 0
                        }
                        self.startAnimate()
                    })
            })
        case .changed:
            let translationX = recognizer.translation(in: self.view).x
            if translationX > 0 {
                swipeToRight.fractionComplete = abs(translationX)/100
            } else {
                swipeToLeft.fractionComplete = abs(translationX)/100
            }
    
        case .ended:
            swipeToRight.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            swipeToLeft.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            return
        }
    }
}
