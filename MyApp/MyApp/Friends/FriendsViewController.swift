//
//  FriendsViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 13.12.2020.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var friendsData: [(String, UIImage)]  = [("Vlad", UIImage(named: "Vlad")!),
                   ("John", UIImage(named: "Jonh")!),
                   ("Anton", UIImage(named: "Anton")!)
    ]
    
    @IBOutlet weak var friendsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friendsTable.delegate = self
        friendsTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsTable.dequeueReusableCell(withIdentifier: "FriendsCell") as! FriendsViewCell
        
        let index = indexPath.row
        let name = friendsData[index].0
        let imag = friendsData[index].1
        
        cell.setData(name: name, image: imag)
        return cell
    }
    
}
