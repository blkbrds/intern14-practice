//
//  HomeViewController.swift
//  BaiTap1
//
//  Created by Nguyen Duong on 6/19/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAvatar()
    }
    
    func setAvatar() {
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.jpg"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userName.text = "Name"
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)
    }
}
