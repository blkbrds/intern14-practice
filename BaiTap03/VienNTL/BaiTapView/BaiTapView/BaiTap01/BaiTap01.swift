//
//  BaiTap01.swift
//  BaiTapView
//
//  Created by Nguyen Truong Lam Vien on 6/18/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap01: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "profile1"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        // Username
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
        userName.text = "Name"
        userName.textAlignment = .center
        userName.backgroundColor = UIColor(red: 116 / 255.0, green: 185 / 255.0, blue: 255 / 255.0, alpha: 1)
        userName.textColor = .blue
        view.addSubview(userName)
    }
}
