//
//  LikeControl.swift
//  MyApp
//
//  Created by Владислав Капиносов on 27.12.2020.
//

import UIKit

class LikeControl: UIControl {
    
    var likesCount = 0 {
        didSet {
            button.setTitle("\(likesCount)", for: .normal)
        }
    }

    var isLiked: Bool = false {
        didSet{
            button.setImage(isLiked ? self.likedImage : self.unlikedImage, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //растягиваем кнопку на весь View
        button.frame = bounds
    }
    
    private var button = UIButton(type: .custom)
    private var unlikedImage = UIImage(systemName: "heart")?.withRenderingMode(.alwaysOriginal)
    private var likedImage = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate)
    private var unlikedScale: CGFloat = 0.8
    private var likedScale: CGFloat = 1.2

    func setupView() {
        //настройки
        backgroundColor = .clear
        button.imageView!.contentMode = .scaleAspectFit
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .red
        button.setImage(unlikedImage, for: .normal)
        button.setTitle(String(likesCount), for: .normal)
        //таргет при нажатии на контрол
        button.addTarget(self, action: #selector(pushLikeButton(_:)), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        self.addSubview(button)

    }
    //обработка нажатия на контрол
    @objc private func pushLikeButton(_ sender: UIButton) {
        isLiked.toggle()
        likesCount = isLiked ? (likesCount + 1) : (likesCount - 1)
        animate()
        self.sendActions(for: .valueChanged)
    }

    private func animate() {
        UIView.animate(withDuration: 0.1, animations: {
            let newImage = self.isLiked ? self.likedImage : self.unlikedImage
            let newScale = self.isLiked ? self.likedScale : self.unlikedScale
            self.button.transform = self.transform.scaledBy(x: newScale, y: newScale)
            self.button.setImage(newImage, for: .normal)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.button.transform = CGAffineTransform.identity
            })
        })
   }

}
