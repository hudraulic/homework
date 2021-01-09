//
//  LoadingViewController.swift
//  MyApp
//
//  Created by Владислав Капиносов on 07.01.2021.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var leftIndicator: UIView!
    @IBOutlet weak var centrIndicator: UIView!
    @IBOutlet weak var rightIndicator: UIView!
    private var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftIndicator.layer.cornerRadius = leftIndicator.bounds.height/2
        centrIndicator.layer.cornerRadius = centrIndicator.bounds.height/2
        rightIndicator.layer.cornerRadius = rightIndicator.bounds.height/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animation()
        
    }
    
    func animation(){
        
        UIView.animateKeyframes(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 1/3) {
                        self.leftIndicator.alpha = 0
                }
                UIView.addKeyframe(
                    withRelativeStartTime: 1/3,
                    relativeDuration: 1/3) {
                        self.leftIndicator.alpha = 1
                        self.centrIndicator.alpha = 0
                }
                UIView.addKeyframe(
                    withRelativeStartTime: 2/3,
                    relativeDuration: 1/3) {
                        self.centrIndicator.alpha = 1
                        self.rightIndicator.alpha = 0
                }
        }) { _ in
            self.rightIndicator.alpha = 1
            if self.counter < 1 {
                self.counter += 1
                self.animation()
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = self.storyboard!.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
                viewController?.modalTransitionStyle = .crossDissolve
                viewController?.modalPresentationStyle = .fullScreen
                self.present(viewController!, animated: true, completion: nil)

            }
        }
    }
    
}
