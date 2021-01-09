//
//  LoadingIndicatorView.swift
//  MyApp
//
//  Created by Владислав Капиносов on 07.01.2021.
//

import UIKit

class LoadingIndicatorView: UIView {

    let leftIndicator: UIView = {
        let leftIndicator = UIView()
        leftIndicator.layer.cornerRadius = leftIndicator.bounds.height/2
        leftIndicator.backgroundColor = .link
        leftIndicator.translatesAutoresizingMaskIntoConstraints = false
        return leftIndicator
    }()
    let centrIndicator: UIView  = {
        let centrIndicator = UIView()
        centrIndicator.layer.cornerRadius = centrIndicator.bounds.height/2
        centrIndicator.backgroundColor = .link
        centrIndicator.translatesAutoresizingMaskIntoConstraints = false
        return centrIndicator
    }()
    let rightIndicator: UIView  = {
        let rightIndicator = UIView()
        rightIndicator.layer.cornerRadius = rightIndicator.bounds.height/2
        rightIndicator.backgroundColor = .link
        rightIndicator.translatesAutoresizingMaskIntoConstraints = false
        return rightIndicator
    }()
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            leftIndicator.topAnchor.constraint(equalTo: topAnchor),
            leftIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            centrIndicator.topAnchor.constraint(equalTo: topAnchor),
            centrIndicator.leadingAnchor.constraint(equalTo: leftIndicator.trailingAnchor, constant: 8),
            centrIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rightIndicator.topAnchor.constraint(equalTo: topAnchor),
            rightIndicator.leadingAnchor.constraint(equalTo: centrIndicator.trailingAnchor, constant: 8),
            rightIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightIndicator.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
