//
//  MyGroupViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class MyGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var myGroup: [Group] = [Group(name: "My Group", icon: UIImage(named: "My Group")!)]
    
    @IBOutlet weak var tableView: UITableView!
   
    private var filteredMyGroup = [Group]()
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

        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredMyGroup.count
        }
        return myGroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell") as! MyGroupViewCell
        
        var group: Group
        if isFiltering {
            group = filteredMyGroup[indexPath.row]
        } else {
            group = myGroup[indexPath.row]
        }
        cell.customView.setImage(group.icon)
        cell.nameGroup.text = group.name
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyGroupViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        filteredMyGroup = myGroup.filter({ (group: Group) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
