//
//  FriendsViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 17.01.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    
    //массив первых букв
    var firstLetter: [String] {
        let firstLetter = friendsList.map { (user) -> String in
            return String(user.last_name.prefix(1)
        )}
        let firstLetterSet = Set(firstLetter)
        return Array(firstLetterSet).sorted()
    }
    var letterDict: [String: [Users]] {
        var friendDict = [String: [Users]]()
        
        for letter in firstLetter {
            friendDict[letter] = friendsList.filter { $0.last_name.prefix(1) == letter }
        }
        return friendDict
    }
    
    private var filteredFriend = [Users]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty : Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    //инициализация контрола со StackView
    let letterControl = LetterControl(frame: .zero)
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "IMG_6077")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "friends")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        view.addSubview(letterControl)
        letterControl.translatesAutoresizingMaskIntoConstraints = false
        letterControl.letters = firstLetter
        letterControl.setupView()
        letterControl.addTarget(self, action: #selector(selectedLetter), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            letterControl.centerYAnchor.constraint(equalTo: tableView.centerYAnchor, constant: 0),
            letterControl.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0),
            letterControl.heightAnchor.constraint(equalToConstant: 350),
            letterControl.widthAnchor.constraint(equalToConstant: 20)
        ])
    

    }
    
    @objc func selectedLetter(){
        let selectLetter = letterControl.selectedLetter
        for indexSextion in 0..<firstLetter.count{
            if selectLetter == firstLetter[indexSextion]{
                tableView.scrollToRow(at: IndexPath(row: 0, section: indexSextion), at: .top, animated: true)
                break
            }
        }
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFriend.count
        } else {
            let letter = firstLetter[section]
            guard let arrFriend = letterDict[letter] else {
                return 0
            }
            return arrFriend.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let letter = firstLetter[indexPath.section]
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "friends") as? FriendsCell,
            let arrFriend = letterDict[letter]
        else { return UITableViewCell() }

        var friend: Users
        if isFiltering {
            friend = filteredFriend[indexPath.row]
        } else {
            friend = arrFriend[indexPath.row]
        }
        cell.name.text = friend.first_name + " " + friend.last_name
        //cell.avatar.setImage(friend.userPhoto)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isFiltering {
            return nil
        }
        return firstLetter[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return 1
        }
        return firstLetter.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "Library") as! LibraryPhotoViewController
        let letter = firstLetter[indexPath.section]
        let arrFriend = letterDict[letter]
        
        var friend: Users
        if isFiltering {
            friend = filteredFriend[indexPath.row]
        } else {
            friend = arrFriend![indexPath.row]
        }
        //controller.photoData.append(contentsOf: friend.userPhotoLibrari)
        show(controller, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        let header = view as? UITableViewHeaderFooterView
        view.tintColor = UIColor.secondarySystemFill
        header?.textLabel?.textColor = UIColor.opaqueSeparator
        header?.textLabel?.font = .systemFont(ofSize: 15)
    }
    
    
}

extension FriendsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String) {
        filteredFriend = friendsList.filter({ (friend: Users) -> Bool in
            return friend.last_name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
