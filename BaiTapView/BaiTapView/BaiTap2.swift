//
//  BaiTap2.swift
//  BaiTapView
//
//  Created by PCI0001 on 6/21/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Person {
    fileprivate var name: String
    fileprivate var image: UIImage
    
    init(_ name: String, _ image: UIImage) {
        self.name = name
        self.image = image
    }
}

class BaiTap2: UIViewController {
    private var person = [Person("Tu", #imageLiteral(resourceName: "tu")),
                          Person("Tuan Anh", #imageLiteral(resourceName: "vu")),
                          Person("Vu", #imageLiteral(resourceName: "tuananh")),
                          Person("Vien", #imageLiteral(resourceName: "vien")),
                          Person("Thanh", #imageLiteral(resourceName: "thanh")),
                          Person("Ronaldo", #imageLiteral(resourceName: "ronaldo")),
                          Person("Messi", #imageLiteral(resourceName: "messi")),
                          Person("Rooney", #imageLiteral(resourceName: "rooney")),
                          Person("Pogba", #imageLiteral(resourceName: "pogba"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toaDo()
    }
    
    func addView(frame: CGRect, name: String, avatarImage: UIImage ) -> UIView {
        let container = UIView(frame: frame)
        container.backgroundColor = .gray
        
        // Add user avatar
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 25))
        userName.text = name
        userName.textAlignment = NSTextAlignment.center
        userName.backgroundColor = .blue
        userName.textColor = .white
        container.addSubview(userName)
        
        return container
    }
    
    func toaDo() {
        var x: CGFloat = 30
        var y: CGFloat = 100
        for i in 0..<person.count {
            let frame =  CGRect(x: x, y: y, width: 100 , height: 125)
            let personView = addView(frame: frame, name: person[i].name, avatarImage: person[i].image)
            view.addSubview(personView)
            x += 130
            if x >= UIScreen.main.bounds.width {
                x = 30
                y += 150
            }
        }
    }
}
