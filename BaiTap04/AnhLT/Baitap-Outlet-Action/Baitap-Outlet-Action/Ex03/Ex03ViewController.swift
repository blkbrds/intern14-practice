//
//  Ex03ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/27/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit
class Interface {
    fileprivate var name: String = " "
    fileprivate var avatar = UIImage()
    
    init(_ name: String,_ avatarUsers: UIImage) {
    self.name = name
    self.avatar = avatarUsers
    }
}

class Ex03ViewController: UIViewController {
    var users: [Interface] = [
        Interface("tu", #imageLiteral(resourceName: "hinh-anh-em-be-de-thuong-31")),
        Interface("vu", #imageLiteral(resourceName: "hinh-em-be-de-thuong-1")),
        Interface("vien", #imageLiteral(resourceName: "Baby-Girl-Names-Inspired-By-Queens-1")),
        Interface("thanh", #imageLiteral(resourceName: "be-yeu")),
        Interface("tien", #imageLiteral(resourceName: "y-tuong-chup-anh-cho-be-trai-5")),
        Interface("tuan anh", #imageLiteral(resourceName: "HN6522_HN2_3933")),
        Interface("thinh", #imageLiteral(resourceName: "hinh-anh-em-be-de-thuong-31")),
        Interface("tung", #imageLiteral(resourceName: "V1084")),
        Interface("bien", #imageLiteral(resourceName: "HN6522_HN2_3933"))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        outPut()
    }
    func addProfileView(frame: CGRect, name: String, avatarImage: UIImage, tag: Int) -> UIView {
        let container = UIView(frame: frame)
        container.backgroundColor = .black
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: frame.height, width: 100, height: 50))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .blue
        userName.textColor = .white
        container.addSubview(userName)
        
        let avatarButton = UIButton(frame: userAvatar.frame)
        avatarButton.backgroundColor = .clear
        avatarButton.tag = tag
        avatarButton.addTarget(self, action: #selector(printName(_:)), for: .touchUpInside)
        container.addSubview(avatarButton)
        return container
    }
    
    func outPut() {
        var x: CGFloat = 6
        var y: CGFloat = 50
        for i in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 100, height: 150)
            let views = addProfileView(frame: frame, name: users[i].name, avatarImage: users[i].avatar, tag: i)
            view.addSubview(views)
            x += 150
            if x >= UIScreen.main.bounds.width {
                x = 6
                y += 150 + 20
            }
        }
    }
    
    @objc func printName(_ button: UIButton) {
        print("\(users[button.tag].name)")

    }
}
