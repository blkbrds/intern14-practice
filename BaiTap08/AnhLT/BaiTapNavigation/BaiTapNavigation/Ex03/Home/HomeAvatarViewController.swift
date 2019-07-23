//
//  HomeAvatarViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/18/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class HomeAvatarViewController: UIViewController {
    var imageTag = 0
    var users: [Avatar] = []
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFilePlist()
        showListAvatar()
        title = "Home"
    }
    
    func loadFilePlist() {
        let a = UserDefaults.standard.bool(forKey: "firstLoad")
        print(a)
        if !a {
            Manager.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
        }
        users = Avatar.parseData(array: Manager.readPlist(namePlist: "Avatar"))
    }

    func addAvatar(_ frame: CGRect, _ name: String, _ avatarImage: UIImage, index: Int) -> UIView {

        let board = UIView(frame: frame)
        let userImage = UIImageView(image: avatarImage)
        userImage.frame = CGRect(x: -13, y: 0, width: 100, height: 100)
        userImage.contentMode = .scaleToFill
        userImage.layer.borderWidth = 2
        board.addSubview(userImage)
        
        let userName = UILabel(frame: CGRect(x: -13, y: 105, width: 100, height: 20))
        userName.text = name
        userName.layer.borderWidth = 1
        userName.textAlignment = .center
        userName.backgroundColor = .blue
        userName.textColor = .white
        board.addSubview(userName)
        return board
        
    }

    func showListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 10
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(users.count / 3 * 120 + (users.count / 3 - 1) * 30))
        scrollView.contentSize = size
        for index in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 100, height: 120)
            let views = addAvatar(frame, users[index].username, UIImage(imageLiteralResourceName: users[index].userImage), index: index)
            views.tag = index
            scrollView.addSubview(views)
            view.addSubview(scrollView)
            x += 150
            let pictureTap = UITapGestureRecognizer(target: self , action: #selector(imageTap))
            views.addGestureRecognizer(pictureTap)
            views.isUserInteractionEnabled = true
            if x >= UIScreen.main.bounds.width {
                x = 20
                y += 150
            }
        }
    }
    
    @objc func imageTap(sender: UIGestureRecognizer) {
        guard let index = sender.view?.tag else {
            return
        }
        let profileView = ProfileViewController()
        profileView.username = users[index].username
        profileView.imageName = users[index].userImage
        imageTag = index
        navigationController?.pushViewController(profileView, animated: true)
        }
}


