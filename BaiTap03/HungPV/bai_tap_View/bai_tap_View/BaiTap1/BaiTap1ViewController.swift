//
//  BaiTap1ViewController.swift
//  btView1
//
//  Created by PCI0010 on 7/18/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADD user Avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // ADD Username
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 25))
        userName.text = "Name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        userName.textAlignment = .center
        view.addSubview(userName)
        
        // Add Button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    
    @objc func buttonDidClick() {
        print("button is Clicked!")
    }
}
