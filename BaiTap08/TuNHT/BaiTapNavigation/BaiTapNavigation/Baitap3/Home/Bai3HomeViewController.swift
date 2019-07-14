//
//  Bai3HomeViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/12/19.
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

class Bai3HomeViewController: UIViewController {
    @IBOutlet private weak var backgroundScrollView: UIScrollView!
    private var persons: [Person] = [Person("Tu", #imageLiteral(resourceName: "user-512")),
                                     Person("Tuan Anh", #imageLiteral(resourceName: "user-512")),
                                     Person("Vu", #imageLiteral(resourceName: "user-512")),
                                     Person("Vien", #imageLiteral(resourceName: "user-512")),
                                     Person("Thanh", #imageLiteral(resourceName: "user-512")),
                                     Person("Ronaldo", #imageLiteral(resourceName: "user-512")),
                                     Person("Messi", #imageLiteral(resourceName: "user-512")),
                                     Person("Rooney", #imageLiteral(resourceName: "user-512")),
                                     Person("Pogba", #imageLiteral(resourceName: "user-512"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        coordinates()
        backgroundScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+1000)
    }
    
    func makeView(frame: CGRect, name: String, avatarImage: UIImage ) -> UIView {
        let container = UIView(frame: frame)
        
        // Add user avatar
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 25))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .gray
        userName.textColor = .white
        container.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(avatarButtonTouchUpInside), for:. touchUpInside)
        container.addSubview(button)
        
        return container
    }
    
    @objc func avatarButtonTouchUpInside() {
        let viewController = ProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func coordinates() {
        var x: CGFloat = 30
        var y: CGFloat = 50
        let itemWidth: CGFloat = 100
        let itemHeight: CGFloat = 125
        
        for i in 0..<persons.count {
            let frame =  CGRect(x: x, y: y, width: itemWidth , height: itemHeight)
            let personView =  makeView(frame: frame, name: persons[i].name, avatarImage: persons[i].image)
            backgroundScrollView.addSubview(personView)
            
            let maxX: CGFloat = UIScreen.main.bounds.width
            let minX: CGFloat = 30
            x += 130
            if x >= maxX {
                x = minX
                y += 200
            }
        }
    }
}
