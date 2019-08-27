//
//  Ex01ViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    
    var listUsers: [Users] = []
    
    @IBOutlet weak var uiScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        uiScrollView.subviews.forEach { view in view.removeFromSuperview() }
        configUI()
        showListAvatar()
    }
    
    func configUI() {
        title = " Ex01 "
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    func showListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for index in 0..<listUsers.count {
            if (x + 100) >= UIScreen.main.bounds.width {
                x = 20
                y += 150 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 80 , height: 150)
            x += 100
            let viewAvatar = getAvatar(user: listUsers[index], index: index + 1)
            viewAvatar.frame = frame
            uiScrollView.addSubview(viewAvatar)
            view.addSubview(uiScrollView)
        }
        uiScrollView.contentSize.height = y + 170
    }
    
    func getAvatar(user: Users, index: Int) -> UIView {
        let userView = MyAvatarView(frame: CGRect(x: 50, y: 100, width: 80, height: 250))
        userView.delegate = self
        userView.userName?.text = user.name
        userView.userAvatar?.image = UIImage(named: user.avatar)
        userView.button?.tag = index
        return userView
    }
    
    func fetchData() {
        DataManagement.share.preparePlistForUseAvatar()
        let listUsers = DataManagement.share.getListUserAvatar(fileName: "UserAvatar", type: "plist")
        self.listUsers = listUsers
    }
}

extension Ex01ViewController: MyAvatarDelegate {
    func avatarView(_ view: MyAvatarView, needPerformAction action: MyAvatarView.Action) {
        switch action {
        case .getAvatar(let index):
            print(index)
        }
    }
}

