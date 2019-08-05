//
//  BaiTap1.swift
//  BaiTapView
//
//  Created by PCI0001 on 6/21/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add user avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "tu"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "Tu"
        userName.textAlignment = NSTextAlignment.center
        userName.backgroundColor = .blue
        userName.textColor = .white
        view.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for:. touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonDidClick() {
        print("Button is clicked!")
    }
    
}
