//
//  Ex01ViewController.swift
//  BaiTapView
//
//  Created by PCI0007 on 6/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "Vu"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "User name"
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for:. touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonDidClick() {
        print("Button is clicked!")
    }
        
}
