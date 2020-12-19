//
//  AllGroupViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class AllGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [Group(name: "GeekBrains", icon: UIImage(systemName: "pencil")!),
                  Group(name: "SwiftBook", icon: UIImage(systemName: "pencil")!),
                  Group(name: "MDK", icon: UIImage(systemName: "pencil")!)
        //("GeekBrains", UIImage(systemName: "pencil")!),
        //("SwiftBook", UIImage(systemName: "pencil")!),
        //("MDK", UIImage(systemName: "pencil")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell") as! AllGroupViewCell
        
        let index = indexPath.row
        let image = groups[index].icon
        let name = groups[index].name
        
        cell.setData(name: name, image: image)
        return cell
    }
}
