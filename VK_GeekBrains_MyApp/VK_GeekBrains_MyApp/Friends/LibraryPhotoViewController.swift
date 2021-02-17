//
//  LibraryPhotoViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 18.01.2021.
//

import UIKit

class LibraryPhotoViewController: UIViewController {

    var photoData: [UIImage] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "IMG_6077")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "libraryPhoto")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "presentPhoto" {
//            guard let present = segue.destination as? PresentPhotoViewController else { return }
//            present.photos.append(contentsOf: photoData)
//        }
//    }

}

extension LibraryPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "libraryPhoto", for: indexPath) as! PhotoFriendsCell
        
        cell.photo.image = photoData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "PresentPhoto") as? PresentPhotoViewController
        
        controller?.photos.append(contentsOf: photoData)
        show(controller!, sender: nil)
    }
}

extension LibraryPhotoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width/2 - 5, height: self.view.bounds.width/2)
    }
    
    func collectionView ( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
}

