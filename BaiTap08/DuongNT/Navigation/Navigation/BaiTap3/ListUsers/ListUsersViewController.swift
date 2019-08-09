//
//  ListUsersViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/9/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ListUsersViewController: UIViewController {

    @IBOutlet private weak var uiScrollView: UIScrollView!

    private var tagCurrent = 0
    private var image = UIImage()
    private var isFirstDisplay: Bool = true
    private var listUsers: [Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        loadFilePlist()
        showListAvatar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isFirstDisplay {
            isFirstDisplay = !isFirstDisplay
        } else {
            loadFilePlist()
            showListAvatar()
        }
    }

    func loadFilePlist() {
        let isFirstLoad = UserDefaults.standard.bool(forKey: "firstLoad")
        if !isFirstLoad {
            FileManagers.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
        }
        listUsers = Users.parseData(array: FileManagers.readPlist(namePlist: "ListUserInform"))
    }

    private func setAvatar(frame: CGRect, name: String, avatarImage: UIImage, index: Int) -> UIView {
        let views = UIView(frame: frame)
        views.backgroundColor = .black
        let userAvatar = UIImageView(image: avatarImage)
        userAvatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar.contentMode = .scaleToFill
        views.addSubview(userAvatar)
        let userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName.text = name
        userName.textAlignment = .center
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        views.addSubview(userName)
        return views
    }

    private func showListAvatar() {
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
