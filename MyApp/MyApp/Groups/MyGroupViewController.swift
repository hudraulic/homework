//
//  MyGroupViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class MyGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var myGroupData: [(String, UIImage)] = []
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell") as! MyGroupViewCell
        
        //let group = myGroupData[indexPath.row]
        let index = indexPath.row
        let image = myGroupData[index].1
        let name = myGroupData[index].0
        cell.setData(name: name, image: image)
        return cell
    }
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addGroup" {
            guard let AllGroupViewController = segue.source as? AllGroupViewController else { return }
            if let indexPath = AllGroupViewController.tableView.indexPathForSelectedRow {
                let group = AllGroupViewController.groups[indexPath.row]
                    myGroupData.append(group)
                    tableView.reloadData()
                }
            }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
