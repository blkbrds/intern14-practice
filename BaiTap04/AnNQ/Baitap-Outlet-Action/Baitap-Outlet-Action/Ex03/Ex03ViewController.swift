//
//  Ex03ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by MBA0217 on 8/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var avatar: String
    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

class Ex03ViewController: UIViewController {

    var users: [Person] = [
        Person("An", "avatar.jpg"),
        Person("Bo", "avatar.jpg"),
        Person("Cao", "avatar.jpg"),
        Person("Dao", "avatar.jpg"),
        Person("Giang", "avatar.jpg"),
        Person("Hien", "avatar.jpg"),
        Person("Khanh", "avatar.jpg"),
        Person("Lien", "avatar.jpg"),
        Person("Manh", "avatar.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDataListUsers()
    }
    
    func addProfileView (frame: CGRect, user: Person, tag: Int) -> UIView {
        let container = UIView(frame: frame)
        
        let userAvatar = UIImageView(image: UIImage(named: user.avatar))
        userAvatar.frame = CGRect(x: 0, y: 0, width: 120, height: 130)
        userAvatar.contentMode = .scaleToFill
        container.backgroundColor = .red
        container.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: 130, width: 120, height: 30))
        userName.text = user.name
        userName.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        userName.textColor = .white
        userName.textAlignment = .center
        container.addSubview(userName)
        
        let nameButton = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 130))
        nameButton.backgroundColor = .clear
        nameButton.tag = tag
        nameButton.addTarget(self, action: #selector(printNameTouchUpInside), for: .touchUpInside)
        container.addSubview(nameButton)
        
        return container
    }
    
    func showDataListUsers() {
        var x: CGFloat = 12
        var y: CGFloat = 40
        for i in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 120, height: 130)
            let container = addProfileView(frame: frame, user: users[i], tag: i)
            view.addSubview(container)
            x += 135
            if x >= UIScreen.main.bounds.width {
                x = 10
                y += 160 + 10
            }
        }
    }
    
    @objc func printNameTouchUpInside(_ button: UIButton) {
        print("\(users[button.tag].name)")
    }
}
