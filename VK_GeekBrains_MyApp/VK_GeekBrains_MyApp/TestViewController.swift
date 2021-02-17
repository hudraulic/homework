//
//  TestViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 06.02.2021.
//

import UIKit

class TestViewController: UIViewController {

    @IBAction func GroupsUser(_ sender: Any) {
        NetworkManager().getGroups()
    }
    @IBAction func photoAction(_ sender: Any) {
        //NetworkManager().getPhoto()
    }
    
    @IBAction func friendsAction(_ sender: Any) {
        //NetworkManager().getFriends()
    }
    
    @IBAction func searchGroups(_ sender: Any) {
        NetworkManager().getSearchGroups(text: searchField.text)
    }
    
    @IBOutlet weak var searchField: UITextField!
    
}
