//
//  AllGroupViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 15.12.2020.
//

import UIKit

class AllGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [
        Group(name: "GeekBrains", icon: UIImage(named: "geekbrains")!),
        Group(name: "SwiftBook", icon: UIImage(systemName: "swift")!),
        Group(name: "IGM", icon: UIImage(named: "IGM")!),
    ]
    
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
            return filteredGroup.count
        }
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell") as! AllGroupViewCell
    
        var group: Group
        if isFiltering {
            group = filteredGroup[indexPath.row]
        } else {
            group = groups[indexPath.row]
        }
        cell.customView.setImage(group.icon)
        cell.nameGroup.text = group.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AllGroupViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        filteredGroup = groups.filter({ (group: Group) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
