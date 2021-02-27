//
//  AllGroupViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class AllGroupViewController: UIViewController {
    
    
    var foundGroups = [Group]()
    var didSelectIndexCommunity: Int?
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty : Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isSearching: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchConfigurator()
        ImageServise().setBackgroundView(self.view)
        
        tableView.delegate = self
        tableView.dataSource = self
     
    }
}

extension AllGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroups") as! AllGroupsCell
        
        ImageServise().getImage(urlStr: foundGroups[indexPath.row].icon) { (data) in
            let icon = UIImage(data: data)
            cell.icon.setImage(icon!)
        }
        cell.nameGroup.text = foundGroups[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension AllGroupViewController: UISearchResultsUpdating {
    
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
        
        NetworkManager().getSearchGroups(text: searchController.searchBar.text) { [weak self] allGroups in
            DispatchQueue.main.async {
                self?.foundGroups = allGroups
                self?.tableView.reloadData()
            }
        }
    }
    private func filterContentForSearchText(_ searchText: String) {
        foundGroups = foundGroups.filter({ (group: Group) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
