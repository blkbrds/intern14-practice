//
//  Bai3HomeViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/12/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai3HomeViewController: UIViewController {
    @IBOutlet private weak var backgroundScrollView: UIScrollView!
    var user: Bai3UserData = Bai3UserData()
    var users: [Bai3UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupData()
        coordinates()
        backgroundScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+1000)
    }
    
    func makeAvatarView(frame: CGRect, tag: Int) -> UIView {
        let container = UIView(frame: frame)
        
        // Add user avatar
        let userAvatar = UIImageView(image:  UIImage(imageLiteralResourceName: user.avatar))
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        container.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 25))
        userName.text = user.name
        userName.textAlignment = .center
        userName.backgroundColor = .gray
        userName.textColor = .white
        container.addSubview(userName)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(avatarButtonTouchUpInside), for: .touchUpInside)
        container.addSubview(button)
        
        return container
    }
    
    @objc func avatarButtonTouchUpInside(_ sender: UIButton) {
        let viewController = ProfileViewController()
        viewController.delegate = self
        guard let superView = sender.superview else { return }
        viewController.user = users[superView.tag]
        viewController.users = self.users
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupData() {
        let db = Bai3Manager()
        users = Bai3UserData.parseData(array: db.getData())
    }
    
    func coordinates() {
        var x: CGFloat = 30
        var y: CGFloat = 50
        let itemWidth: CGFloat = 100
        let itemHeight: CGFloat = 125
        for (index, user) in users.enumerated() {
            let frame =  CGRect(x: x, y: y, width: itemWidth , height: itemHeight)
            self.user = user
            let personView =  makeAvatarView(frame: frame, tag: index)
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

    func updateCoordinates(_ newUser: Bai3UserData) {
        var x: CGFloat = 30
        var y: CGFloat = 50
        let itemWidth: CGFloat = 100
        let itemHeight: CGFloat = 125
        for (index, user) in users.enumerated() {
            let frame =  CGRect(x: x, y: y, width: itemWidth , height: itemHeight)
            if user.avatar == newUser.avatar {
                users.remove(at: index)
                users.insert(newUser, at: index)
                self.user = newUser
            } else {
                self.user = user
            }
            let personView =  makeAvatarView(frame: frame, tag: index)
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

extension Bai3HomeViewController: ProfileViewControllerDelegate {
    func editProfile(user: Bai3UserData) {
        updateCoordinates(user)
    }
}
