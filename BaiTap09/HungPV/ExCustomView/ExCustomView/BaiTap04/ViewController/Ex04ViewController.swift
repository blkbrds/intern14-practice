//
//  Ex04ViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/22/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex04 "
        navigationController?.navigationBar.backgroundColor = .cyan
        configUI()
    }
    
    func configUI() {
        let emailLabel = MyBadgeView(frame: CGRect(x: 80, y: 140, width: 210, height: 90), value: 12, badgePosition: .topRight)
        emailLabel.backgroundColor = .green
        emailLabel.layer.cornerRadius = 25
        emailLabel.badgeTitle!.text = "Emails"
        view.addSubview(emailLabel)
        
        let friendsLabel = MyBadgeView(frame: CGRect(x: 80, y: 260, width: 210, height: 90), value: 101, badgePosition: .topLeft)
        friendsLabel.backgroundColor = .orange
        friendsLabel.layer.cornerRadius = 25
        friendsLabel.badgeTitle!.text = "Friends"
        view.addSubview(friendsLabel)
        
        let photosLabel = MyBadgeView(frame: CGRect(x: 80, y: 380, width: 210, height: 90), value: 8, badgePosition: .bottomCenter)
        photosLabel.backgroundColor = .purple
        photosLabel.layer.cornerRadius = 25
        photosLabel.badgeTitle!.text = "Photos"
        view.addSubview(photosLabel)
        
    }
}
