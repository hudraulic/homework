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
            URLQueryItem(name: "scope", value: "401502"),
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
    func getPhoto(ownerID: Int?, onComplete: @escaping ([Photo]) -> Void) {
        
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
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //print(url)
            guard let data = data, error == nil else {return}
            
            let decoder = JSONDecoder()
            do {
                let decode = try decoder.decode(Response<Photo>.self, from: data)
                let photo = decode.response.items
                onComplete(photo)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    //MARK: - Friends User
    func getFriends (onComplete: @escaping (([Users]) -> Void)) {
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_100"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            let decoder = JSONDecoder()
            do {
                let decode = try decoder.decode(Response<Users>.self, from: data)
                let friends = decode.response.items
                onComplete(friends)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    //MARK: - Groups User
    func getGroups(onComplete: @escaping (([Group]) -> Void)) {
        
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "description"),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}

            let decoder = JSONDecoder()
            do {
                let decode = try decoder.decode(Response<Group>.self, from: data)
                let myGroups = decode.response.items
                onComplete(myGroups)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func joinGroup(id: Int, onComplete: @escaping ((Int) -> Void)) {
        urlComponents.path = "/method/groups.join"
        urlComponents.queryItems = [
            URLQueryItem(name: "group_id", value: String(id)),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.126")
        ]
        guard let url = urlComponents.url else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {return}
            //print(url)
            let decoder = JSONDecoder()
            
            do {
                let decode = try decoder.decode(ResponseJoin.self, from: data)
                onComplete(decode.response)
            } catch {
                print("Запрос отклонён")
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func leaveGroup(id: Int, onComplete: @escaping ((Int) -> Void)) {
        urlComponents.path = "/method/groups.leave"
        urlComponents.queryItems = [
            URLQueryItem(name: "group_id", value: String(id)),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.126")
        ]
        guard let url = urlComponents.url else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            let decoder = JSONDecoder()
            do {
                let decode = try decoder.decode(ResponseJoin.self, from: data)
                onComplete(decode.response)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    func getSearchGroups(text: String?, onComplete: @escaping (([Group])-> Void)) {
        
        guard text != "" else {
            return
        }
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: text),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data else {return}
            guard error == nil else {return}

            let decoder = JSONDecoder()
            do {
                let decode = try decoder.decode(Response<Group>.self, from: data)
                let allGroups = decode.response.items
                onComplete(allGroups)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
