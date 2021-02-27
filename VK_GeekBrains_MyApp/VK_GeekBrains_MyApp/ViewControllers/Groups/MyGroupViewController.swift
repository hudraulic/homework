//
//  MyGroupViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class MyGroupViewController: UIViewController {
    
        
    @IBOutlet weak var tableView: UITableView!
    private var myGroup: [Group] = []
    
    private var filteredGroup = [Group]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty : Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ImageServise().setBackgroundView(self.view)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchConfigurator()
        
        NetworkManager().getGroups { [weak self] myGroups in
            DispatchQueue.main.async {
                self?.myGroup = myGroups
                self?.addToDatabase()
            }
        }
    }
    func addToDatabase() {
        let db = DatabaseGr()
        myGroup.forEach ({ db.write($0) })
        let dataGroup = db.read()
        myGroup = dataGroup ?? []
        self.tableView.reloadData()
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addGroup" {
            guard let allGroupViewController = segue.source as? AllGroupViewController else { return }
            
            if let indexPath = allGroupViewController.tableView.indexPathForSelectedRow {
                let group = allGroupViewController.foundGroups[indexPath.row]
                NetworkManager().joinGroup(id: group.id) { (value) in
                    if value != 1 {
                        self.myGroup.append(group)
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
}

extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredGroup.count
        }
        return myGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroup") as! MyGroupCell
        
        var group: Group
        if isFiltering {
            group = filteredGroup[indexPath.row]
        } else {
            group = myGroup[indexPath.row]
        }
        cell.nameGroup.text = group.name
        ImageServise().getImage(urlStr: group.icon) { (data) in
            let icon = UIImage(data: data)
            cell.icon.setImage(icon!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                NetworkManager().leaveGroup(id: self.myGroup[indexPath.row].id) { (value) in
                    if value == 1 {
                        self.myGroup.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
}

extension MyGroupViewController: UISearchResultsUpdating {
    
    func searchConfigurator() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.searchTextField.textColor = .opaqueSeparator
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        filteredGroup = myGroup.filter({ (group: Group) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
