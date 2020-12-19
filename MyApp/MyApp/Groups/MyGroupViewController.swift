//
//  MyGroupViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class MyGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var myGroup = [Group]()
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell") as! MyGroupViewCell
        
        //let group = myGroupData[indexPath.row]
        let index = indexPath.row
        let image = myGroup[index].icon
        let name = myGroup[index].name
        cell.setData(name: name, image: image)
        return cell
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
