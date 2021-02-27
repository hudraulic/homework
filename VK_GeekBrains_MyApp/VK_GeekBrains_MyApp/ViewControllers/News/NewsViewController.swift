//
//  NewsViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 19.01.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageServise().setBackgroundView(self.view)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "news")
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "news") as! NewsViewCell
        
        let newPost = news[indexPath.row]
        cell.name.text = newPost.name
        cell.icon.setImage(newPost.icon)
        cell.disk.text = newPost.distc
        cell.photoView.setImages(newPost.imageNews)
        
        return cell
    }
    
}

