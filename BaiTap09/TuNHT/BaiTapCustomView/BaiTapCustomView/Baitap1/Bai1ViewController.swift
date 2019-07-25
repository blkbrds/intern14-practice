//
//  Bai1ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/22/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai1ViewController: UIViewController {
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    var user: Bai1UserData = Bai1UserData()
    var users: [Bai1UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        coordinates()
        backgroundScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+1300)
    }
    
    private func setupData() {
        let db = Bai1Manager()
        users = Bai1UserData.parseData(array: db.getData())
    }
    
    private func listAvatar(avatarView: MyAvatar, tag: Int) -> UIView {
        avatarView.delegate = self
        avatarView.userName?.text = user.name
        avatarView.userAvatar?.image = UIImage(imageLiteralResourceName: user.avatar)
        return avatarView
    }
    
    func coordinates() {
        var x: CGFloat = 30
        var y: CGFloat = 50
        let itemWidth: CGFloat = 100
        let itemHeight: CGFloat = 125
        
        for (index, user) in users.enumerated() {
            self.user = user
            let myAvatar = MyAvatar()
            let personView = listAvatar(avatarView: myAvatar, tag: index)
            let frame =  CGRect(x: x, y: y, width: itemWidth , height: itemHeight)
            personView.frame = frame
            personView.tag = index
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

extension Bai1ViewController: MyAvatarDelegate {
    func myAvatarView(_ myAvatar: MyAvatar) {
        print("\(String(describing: myAvatar.userName))")
    }
}
