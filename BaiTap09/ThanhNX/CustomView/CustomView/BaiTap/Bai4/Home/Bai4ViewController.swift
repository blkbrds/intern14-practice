//
//  Bai4ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/23/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai4ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bai 4"
        
        let xButton = UIScreen.main.bounds.width / 2 - 75
        
        let emailButton = MyButton(frame: CGRect(x: xButton, y: 200, width: 150, height: 80), badgeNumber: 1, badgePosition: .bottomRight)
        emailButton.title = "Email"
        emailButton.backgroundColor = #colorLiteral(red: 0.4401525557, green: 0.6798833013, blue: 0.2787234783, alpha: 1)
        emailButton.layer.cornerRadius = 20
        view.addSubview(emailButton)
        
        let friendsButton = MyButton(frame: CGRect(x: xButton, y: 300, width: 150, height: 80), badgeNumber: 20, badgePosition: .bottomLeft)
        friendsButton.title = "Friends"
        friendsButton.backgroundColor = #colorLiteral(red: 1, green: 0.7774117589, blue: 0.1402215064, alpha: 1)
        friendsButton.layer.cornerRadius = 20
        view.addSubview(friendsButton)
        
        let photosButton = MyButton(frame: CGRect(x: xButton, y: 400, width: 150, height: 80), badgeNumber: 30 ,badgePosition: .bottomCenter)
        photosButton.title = "Photos"
        photosButton.backgroundColor = #colorLiteral(red: 0.4382379651, green: 0.1877502799, blue: 0.6286199093, alpha: 1)
        photosButton.layer.cornerRadius = 20
        view.addSubview(photosButton)
    }
}
