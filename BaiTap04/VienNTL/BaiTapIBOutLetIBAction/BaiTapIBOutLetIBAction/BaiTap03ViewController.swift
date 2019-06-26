//
//  BaiTap03ViewController.swift
//  BaiTapIBOutLetIBAction
//
//  Created by Nguyen Truong Lam Vien on 6/26/19.
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
    
    static func Data() -> [User] {
        return [
            User("X-Men 1", #imageLiteral(resourceName: "img7")),
            User("BatMan", #imageLiteral(resourceName: "img9")),
            User("X-Men 2", #imageLiteral(resourceName: "img5")),
            User("X-Men 3", #imageLiteral(resourceName: "img6")),
            User("X-Men 4", #imageLiteral(resourceName: "img1")),
            User("Hulk", #imageLiteral(resourceName: "img4")),
            User("X-Men 5", #imageLiteral(resourceName: "img2")),
            User("Predator", #imageLiteral(resourceName: "img8")),
            User("X-Men 6", #imageLiteral(resourceName: "img5")),
        ]
    }
}

class BaiTap03ViewController: UIViewController {
    var items: [User] = User.Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPut()
    }

    func addProfileView(frame: CGRect, name: String, avatarImage: UIImage, tag: Int) -> UIView {
        let container = UIView(frame: frame)
        container.backgroundColor = .black
        
        // Avatar
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        // Button
        let avatarButton = UIButton(frame: userAvatar.frame)
        avatarButton.backgroundColor = .clear
        avatarButton.tag = tag
        avatarButton.addTarget(self, action: #selector(printName(_:)), for: .touchUpInside)
        container.addSubview(avatarButton)
        
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
        for index in 0..<items.count {
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130 )
            let views = addProfileView(frame: frame, name: items[index].name, avatarImage: items[index].avatar, tag: index)
            view.addSubview(views)
            x += 120
            if x >= UIScreen.main.bounds.width {
                x = 20
                y += 130 + 20
            }
        }
    }
    
    @objc func printName(_ button: UIButton) {
        print("Movie: \(items[button.tag].name)")
    }
}


