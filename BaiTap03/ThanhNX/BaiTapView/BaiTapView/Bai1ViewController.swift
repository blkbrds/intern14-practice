//
//  Bai1ViewController.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/17/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
        userName.text = "Name1"
        userName.textAlignment = NSTextAlignment.center
        userName.backgroundColor = UIColor(red: 116/255.0, green: 185/255.0, blue: 255/255.0, alpha: 1)
        userName.textColor = .white
        view.addSubview(userName)
    }
}
