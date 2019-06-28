//
//  Ex02ViewController.swift
//  BaiTapView
//
//  Created by PCI0007 on 6/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class User {
    var name: String = ""
    var avatar = UIImage()
    init (_ name: String, _ avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
}

class Ex02: UIViewController {
    var users: [User] = [User("User 1", #imageLiteral(resourceName: "download (1)")), User("User 2", #imageLiteral(resourceName: "download (2)")), User("User 3", #imageLiteral(resourceName: "download (3)")), User("User 4", #imageLiteral(resourceName: "download (4)")), User("User 5", #imageLiteral(resourceName: "5")), User("User 6", #imageLiteral(resourceName: "6")), User("User 7", #imageLiteral(resourceName: "s-l1600")), User("User 8", #imageLiteral(resourceName: "5020657994618_01c")), User("User 9", #imageLiteral(resourceName: "5020657994625_01c"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        add()
    }
    
    private func addAvatar(_ frame: CGRect, _ name: String, _ userImage: UIImage) -> UIView {
        let board = UIView(frame: frame)
        let avatar = UIImageView(image: userImage)
        avatar.frame = CGRect(x: -10, y: 100, width: 100, height: 100)
        avatar.contentMode = .scaleToFill
        board.addSubview(avatar)
        let userName = UILabel(frame: CGRect(x: 0, y: 200, width: 100, height: 20))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .gray
        userName.textColor = .blue
        board.addSubview(userName)
        return board
    }
    
    private func add() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for i in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 100, height: 120)
            let views = addAvatar(frame, users[i].name, users[i].avatar)
            view.addSubview(views)
            x += 150
            if x >= UIScreen.main.bounds.width {
                x = 20
                y += 120
            }
            
        }
    }
}

