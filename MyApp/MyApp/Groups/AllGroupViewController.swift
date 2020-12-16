//
//  AllGroupViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class AllGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [/*"GeekBrains", "SwiftBook", "MDK"*/
        ("GeekBrains", UIImage(systemName: "pencil")!),
        ("SwiftBook", UIImage(systemName: "pencil")!),
        ("MDK", UIImage(systemName: "pencil")!)
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
        let image = groups[index].1
        let name = groups[index].0
        
        cell.setData(name: name, image: image)
        return cell
    }
}
