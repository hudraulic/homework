//
//  VKWebViewController.swift
//  VK_GeekBrains_MyApp
//
//  Created by Владислав Капиносов on 06.02.2021.
//

import UIKit
import WebKit

class VKWebViewController: UIViewController {

    private var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = webView
        webView.navigationDelegate = self
        if let request = NetworkManager().getAuthorizeRequest(){
            webView.load(request)
        }
    }
    
}

extension VKWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce ([String:String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
                
        }
        
        let token = params["access_token"]
        let userID = params["user_id"]
        Session.shared.userID = Int(userID ?? "")
        Session.shared.token = token!
        
        if token != nil {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
        
        decisionHandler(.cancel)
    }
}
