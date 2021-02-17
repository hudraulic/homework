//
//  NetworkManager.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 06.02.2021.
//

import Foundation

class NetworkManager {
    
    private var urlComponents = URLComponents()
    private let configuration: URLSessionConfiguration!
    private let session: URLSession!
    
    init(){
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    func  getAuthorizeRequest() -> URLRequest? {
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7752557"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
    //MARK: - Photo
    func getPhoto(for ownerID: Int?, onComplete: @escaping ([Photo]) -> Void) {
        
        urlComponents.path = "/method/photos.getAll"
        
        guard let owner = ownerID else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "owner_id", value: String(owner)),
            URLQueryItem(name: "photo_sizes", value: "1"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "v", value: "5.126")
        ]
        guard let url = urlComponents.url else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("User Photo -------------------------")
            print(json)
            print("------------------------------------")
        }
        task.resume()
    }
    
    //MARK: - Friends User
    func getFriends(onComplete: @escaping ([Users]) -> ()) {
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_100"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            print(String(data: data!, encoding: .utf8))
            guard let data = data else {return}
            guard error == nil else {return}
            do {
                let friends = try JSONDecoder().decode([Users].self, from: data)
                onComplete(friends)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    //MARK: - Groups User
    func getGroups() {
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "description"),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Groups User -------------------------")
            print(json)
            print("------------------------------------")
        }
        task.resume()
    }
    
    func getSearchGroups(text: String?) {
        
        guard text != "" else {
            print("!!!")
            return
        }
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: text),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print("Результат Поиска -------------------------")
            print(json)
            print("------------------------------------")
        }
        task.resume()
    }
}
