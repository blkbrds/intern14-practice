//
//  BaiTap02.swift
//  BaiTapView
//
//  Created by Nguyen Truong Lam Vien on 6/18/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class User {
    var name: String = ""
    var avatar = UIImage()
    
    init(_ name: String, _ avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
}

class BaiTap02: UIViewController {
    
    var users: [User] = [
        User("Log Out", #imageLiteral(resourceName: "logout")),
        User("A", #imageLiteral(resourceName: "default-avatar")),
        User("Leogo", #imageLiteral(resourceName: "Imagelogo")),
        User("Information", #imageLiteral(resourceName: "information")),
        User("Man", #imageLiteral(resourceName: "profile")),
        User("Boy", #imageLiteral(resourceName: "kid")),
        User("Exit", #imageLiteral(resourceName: "login")),
        User("Lock", #imageLiteral(resourceName: "change-password")),
        User("B", #imageLiteral(resourceName: "profile1")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPut()
    }
    
    func addProfileView(frame: CGRect, name: String, avatarImage: UIImage ) -> UIView {
        let container = UIView(frame: frame)
        container.backgroundColor = .black
        
        // Avatar
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        // Username
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = UIColor(red: 116 / 255.0, green: 185 / 255.0, blue: 255 / 255.0, alpha: 1)
        userName.textColor = .blue
        container.addSubview(userName)
        
        return container
    }
    
    func outPut() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for index in 0..<users.count {
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130 )
            let views = addProfileView(frame: frame, name: users[index].name, avatarImage: users[index].avatar)
            view.addSubview(views)
            x += 120
            if x >= UIScreen.main.bounds.width {
                x = 20
                y += 130 + 20
            }
        }
    }
}

