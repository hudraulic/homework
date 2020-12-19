//
//  PhotoFriendsViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class PhotoFriendsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photoData: [UIImage] = []
    @IBOutlet weak var photoFriends: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoFriends.delegate = self
        photoFriends.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoFriends.dequeueReusableCell(withReuseIdentifier: "PhotoFriendsCell", for: indexPath) as! PhotoFriendsViewCell
        
        let photo = photoData[indexPath.row]
        cell.setData(photo: photo)
        return cell
    }
    
}
