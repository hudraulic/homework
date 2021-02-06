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
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        guard let url = urlComponents.url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
    
}
