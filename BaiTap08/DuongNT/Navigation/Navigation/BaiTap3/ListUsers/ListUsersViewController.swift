//
//  ListUsersViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ListUsersViewController: UIViewController {
    
    @IBOutlet weak var uiScrollView: UIScrollView!
//    var users: [Users] = [
//        Users("Name 1", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 2", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 3", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 4", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 5", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 6", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 7", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 8", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 9", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 10", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 11", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 12", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 13", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 14", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 15", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 16", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 17", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 18", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 19", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 20", UIImage(imageLiteralResourceName: "avatar")),
//        Users("Name 21", UIImage(imageLiteralResourceName: "avatar"))
//    ]
    weak var delegate: ClassListUsersVCDelegate?
    var tagCurrent = 0
    var image = UIImage()
    private var isFirstDisplay: Bool = true
    private var listUsers: [Users] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        loadFilePlist()
        showListAvatar()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if isFirstDisplay {
            isFirstDisplay = !isFirstDisplay
        } else {
            loadFilePlist()
            showListAvatar()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFilePlist() {
        let a = UserDefaults.standard.bool(forKey: "firstLoad")
        print(a)
        if !a {
            FileManagers.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
            listUsers = Users.parseData(array: FileManagers.readPlist(namePlist: "ListUserInform"))
        } else {
            listUsers = Users.parseData(array: FileManagers.readPlist(namePlist: "ListUserInform"))
        }
    }
    
    func setAvatar(frame: CGRect, name: String, avatarImage: UIImage, index: Int) -> UIView {
        let views = UIView(frame: frame)
        views.backgroundColor = .black
        
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        views.addSubview(userAvatar)
        delegate?.changeAvatar(image)
        
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
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
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 20
                y += 130 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130)
            x += 120
            let views = setAvatar(frame: frame, name: listUsers[index].name, avatarImage: UIImage(imageLiteralResourceName: listUsers[index].avatar), index: index)
            views.tag = index
            let pictureTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            views.addGestureRecognizer(pictureTap)
            views.isUserInteractionEnabled = true
            uiScrollView.addSubview(views)
            view.addSubview(uiScrollView)
        }
    }

    @objc func imageTapped(sender: UITapGestureRecognizer) {
        let userDetailVC = UserDetailViewController()
        guard let index = sender.view?.tag else {
            return
        }
        userDetailVC.imageUser = UIImage(imageLiteralResourceName: listUsers[index].avatar)
        userDetailVC.name = listUsers[index].name
        userDetailVC.avatar = listUsers[index].avatar
        tagCurrent = index
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
}
protocol ClassListUsersVCDelegate: class {
    func changeAvatar(_ avatar: UIImage?)
}
