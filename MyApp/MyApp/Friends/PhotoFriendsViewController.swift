//
//  PhotoFriendsViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class PhotoFriendsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   var photoData: [UIImage] = [UIImage(named: "Vlad")!, UIImage(named: "Jonh")!, UIImage(named: "Anton")!]

    @IBOutlet weak var photoFriends: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoFriends.delegate = self
        photoFriends.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoFriends.dequeueReusableCell(withReuseIdentifier: "PhotoFriendsCell", for: indexPath) as! PhotoFriendsViewCell
        
        let index = indexPath.row
        let photo = photoData[index]
        cell.setData(photo: photo)
        return cell
    }
    
}
