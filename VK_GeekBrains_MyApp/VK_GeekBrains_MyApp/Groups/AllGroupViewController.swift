//
//  AllGroupViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class AllGroupViewController: UIViewController {
    
    var groups = [
        Group(name: "GeekBrains", icon: UIImage(named: "geekbrains")!, id: 1),
        Group(name: "SwiftBook", icon: UIImage(systemName: "swift")!, id: 2),
        Group(name: "IGM", icon: UIImage(named: "IGM")!, id: 3),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "IMG_6077")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
     
    }
    

}

extension AllGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroups") as! AllGroupsCell
        
        cell.icon.setImage(groups[indexPath.row].icon)
        cell.nameGroup.text = groups[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
