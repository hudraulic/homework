//
//  NewsViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 04.01.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "news") as! NewsCell
        
        let newPost = news[indexPath.row]
        cell.name.text = newPost.name
        cell.customView.setImage(newPost.icon)
        cell.discLabel.text = newPost.distc
        cell.imageNews.image = newPost.imageNews
        
        return cell
    }
    
    
}
