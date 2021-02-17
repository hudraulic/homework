//
//  MyGroupViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class MyGroupViewController: UIViewController {
    
        
    @IBOutlet weak var tableView: UITableView!
    
    var id = Set(arrayLiteral: 0,1,2,3,4)
    var myGroup: [Group] = [Group(name: "My Group", icon: UIImage(named: "My Group")!, id: 0 )]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "IMG_6077")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addGroup" {
            guard let AllGroupViewController = segue.source as? AllGroupViewController else { return }
            if let indexPath = AllGroupViewController.tableView.indexPathForSelectedRow {
                let group = AllGroupViewController.groups[indexPath.row]
                myGroup.append(group)
                tableView.reloadData()
            }
        }
    }

}

extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroup") as! MyGroupCell
        
        cell.icon.setImage(myGroup[indexPath.row].icon)
        cell.nameGroup.text = myGroup[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
}
