//
//  BaiTap2ViewController.swift
//  btView1
//
//  Created by PCI0010 on 7/18/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit
class Users {
    var name:String
    var myAvatar = UIImage()
    
    init(name: String, myAvatar: UIImage) {
        self.name = name
        self.myAvatar = myAvatar
    }
    
}
class BaiTap2ViewController: UIViewController {
    var users : [Users] = [ Users(name: "name 1", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 2", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 3", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 4", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 5", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 6", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 7", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 8", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
                            Users(name: "name 9", myAvatar: UIImage(imageLiteralResourceName: "avatar")),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        listAvatar()
    }
    
    func frameView(frame: CGRect, userAvatar: UIImage, name: String) -> UIView {
        let pView = UIView(frame: frame)
        pView.backgroundColor = .clear
        
        let userName = UILabel(frame: CGRect(x: 0, y: 150, width: 90, height: 30))
        userName.backgroundColor = .lightGray
        userName.text = name
        userName.textColor = .blue
        userName.textAlignment = .center
        pView.addSubview(userName)
        
        
        let frame = CGRect(x: 0, y: 70, width: 90, height: 80)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        pView.addSubview(userAvatar)
        
        return pView
        
    }
    
    func listAvatar() {
        var x: CGFloat = 30
        var y: CGFloat = 50
        for index in 0..<users.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 30
                y += 130 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130 )
            x += 100
            let views = frameView(frame: frame, userAvatar: users[index].myAvatar, name: users[index].name)
            view.addSubview(views)
        }
    }
}

