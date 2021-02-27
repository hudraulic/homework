//
//  LibraryPhotoViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 18.01.2021.
//

import UIKit

class LibraryPhotoViewController: UIViewController {

    var photos: [Photo] = []
    var userID: Int?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageServise().setBackgroundView(self.view)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellWithReuseIdentifier: "libraryPhoto")
    
        NetworkManager().getPhoto(ownerID: userID) { [weak self] (photo) in
            DispatchQueue.main.async {
                self?.photos = photo
                self?.addToDatabase()
            }
        }
        
    }
    
    private func addToDatabase() {
        let db = DatabasePh()
        db.write(photos)
        let dataPh = db.read()
        photos = dataPh ?? []
        self.collectionView.reloadData()
    }
    
    func presentPhoto(urlStr: String, onComplete: @escaping ((Data) -> Void)) {
        guard let url = URL(string: urlStr) else {return}
        
        if let data = try? Data(contentsOf: url) {
            onComplete(data)
        }
    }
}

extension LibraryPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "libraryPhoto", for: indexPath) as! PhotoFriendsCell
        
        let url = photos[indexPath.row].sizes[indexPath.row].url
        ImageServise().getImage(urlStr: url) { (data) in
            let photo = UIImage(data: data)
            cell.photo.image = photo
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "PresentPhoto") as? PresentPhotoViewController
        
        controller?.photos.append(contentsOf: photos)
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

