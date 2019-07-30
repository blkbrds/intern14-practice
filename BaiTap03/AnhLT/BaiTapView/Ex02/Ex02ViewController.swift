//
//  Ex02ViewController.swift
//  BaiTapView
//
//  Created by PCI0013 on 6/20/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Person {
    var name: String = " "
    var avatar = UIImage()
    
    init(_ name: String,_ avatar: UIImage) {
        self.name = name
        self.avatar = avatar
    }
}

class Ex02ViewController: UIViewController {

    var users: [Person] = [
        Person("tu", #imageLiteral(resourceName: "top-20-ten-chu-thien-ba-me-danh-dat-cho-con-de-thuong-va-y-nghia-nhat-6659-1")),
        Person("vu", #imageLiteral(resourceName: "hinh-em-be-de-thuong-1")),
        Person("vien", #imageLiteral(resourceName: "Baby-Girl-Names-Inspired-By-Queens-1")),
        Person("thanh", #imageLiteral(resourceName: "be-yeu")),
        Person("tien", #imageLiteral(resourceName: "y-tuong-chup-anh-cho-be-trai-5")),
        Person("tuan anh", #imageLiteral(resourceName: "HN6522_HN2_3933")),
        Person("thinh", #imageLiteral(resourceName: "hinh-anh-em-be-de-thuong-31")),
        Person("tung", #imageLiteral(resourceName: "V1084")),
        Person("bien", #imageLiteral(resourceName: "HN6522_HN2_3933"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPut()
    }
    
    func addProfileView(frame: CGRect, name: String, avatarImage: UIImage) -> UIView {
        let container = UIView(frame: frame)

        let frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: 200, width: 100, height: 50))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .blue
        userName.textColor = .white
        container.addSubview(userName)
        return container
    }
    
    func outPut() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for i in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 100, height: 130)
            let views = addProfileView(frame: frame, name: users[i].name, avatarImage: users[i].avatar)
            view.addSubview(views)
            x += 120
            if x >= UIScreen.main.bounds.width {
                x = 20
                y += 130 + 20
            }
        }
    }
}
<<<<<<< Updated upstream


=======
>>>>>>> Stashed changes
