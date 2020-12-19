//
//  FriendsViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 13.12.2020.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friendsList = [
        Users(name: "Vlad", userPhoto: UIImage(named: "Vlad")!, librariPhoto: [UIImage(named: "Vlad")!, UIImage(systemName: "pencil")!]),
        Users(name: "Jonh", userPhoto: UIImage(named: "Jonh")!, librariPhoto: [UIImage(named: "Jonh")!, UIImage(systemName: "pencil")!]),
        Users(name: "Anton", userPhoto: UIImage(named: "Anton")!, librariPhoto: [UIImage(named: "Anton")!, UIImage(systemName: "pencil")!])
    ]
    
    @IBOutlet weak var friendsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsTable.delegate = self
        friendsTable.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLibrary" {
            guard let goToLibrary = segue.destination as? PhotoFriendsViewController else { return }
            if let indexPath = friendsTable.indexPathForSelectedRow {
                let user = friendsList[indexPath.row]
                goToLibrary.photoData.append(contentsOf: user.userPhotoLibrari)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTable.dequeueReusableCell(withIdentifier: "FriendsCell") as! FriendsViewCell
        
        let index = indexPath.row
        let name = friendsList[index].name
        let imag = friendsList[index].userPhoto
        
        cell.setData(name: name, image: imag)
        return cell
    }
    
}
