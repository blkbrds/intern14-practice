//
//  MyAvatarViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/13/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MyAvatarViewController: UIViewController {
    
    var listUsers: [Users] = []
    
    @IBOutlet weak var uiScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ex03"
        navigationController?.navigationBar.backgroundColor = .cyan
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        uiScrollView.subviews.forEach { view in view.removeFromSuperview() }
        fetchData()
        showListAvatar()
    }
    
    func setAvatar(frame: CGRect, name: String, avatarImage: UIImage, index: Int) -> UIView {
        let views = UIView(frame: frame)
        views.backgroundColor = .clear
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        userAvatar.contentMode = .scaleToFill
        views.addSubview(userAvatar)
        let userName = UILabel(frame: CGRect(x: 0, y: 80, width: 80, height: 25))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        views.addSubview(userName)
        return views
    }
    
    func showListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for index in 0..<listUsers.count {
            if (x + 100) >= UIScreen.main.bounds.width {
                x = 20
                y += 100 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130)
            x += 100
            let views = setAvatar(frame: frame, name: listUsers[index].name, avatarImage: UIImage(imageLiteralResourceName: listUsers[index].avatar), index: index)
            views.tag = index
            uiScrollView.addSubview(views)
            view.addSubview(uiScrollView)
            let tapped = UITapGestureRecognizer(target: self, action: #selector(tappedPicture))
            views.addGestureRecognizer(tapped)

        }
        uiScrollView.contentSize = CGSize(width: x, height: y + 120)
    }
    
    @objc func tappedPicture(sender: UITapGestureRecognizer) {
        let vc = ProfileViewController()
        guard let index = sender.view?.tag else {
            return
        }
        vc.name = listUsers[index].name
        vc.myAvatar = UIImage(imageLiteralResourceName: listUsers[index].avatar)
        vc.avatar = listUsers[index].avatar
        vc.currentUser = listUsers[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData() {
        DataManagement.share.preparePlistForUseAvatar()
        let listUsers = DataManagement.share.getListUserInfo2(fileName: "ListUsers", type: "plist")
        self.listUsers = listUsers
    }
    
}





