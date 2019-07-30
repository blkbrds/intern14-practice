//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/23/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var users: [Avatar] = []
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFilePlist()
        showListAvatar()
    }
    
    func loadFilePlist() {
        let check = UserDefaults.standard.bool(forKey: "firstLoad")
        print(check)
        if !check {
            Manager.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
        }
        users = Avatar.parseData(array: Manager.readPlist(namePlist: "Avatar"))
    }
    
    func addAvatar(_ user: Avatar, _ index: Int) -> UIView {
        let userView = UserView(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        userView.delegate = self
        userView.userAvatar?.image = UIImage(named: user.userImage)
        userView.userName?.text = user.username
        return userView
    }
    
    func showListAvatar() {
        var x: CGFloat = 10
        var y: CGFloat = 10
        let size = CGSize(width: UIScreen.main.bounds.width, height: CGFloat(users.count / 3 * 120 + (users.count / 3 - 1) * 30))
        scrollView.contentSize = size
        for index in 0..<users.count {
            let views = addAvatar(users[index], index + 1)
            let frame = CGRect(x: x, y: y, width: 100, height: 120)
            views.frame = frame
            views.tag = index
            scrollView.addSubview(views)
            view.addSubview(scrollView)
            x += 145
            if x >= UIScreen.main.bounds.width {
                x = 10
                y += 150
            }
        }
    }
}

extension HomeViewController: UserViewDelegate {
    
    func view(_ view: UserView, needPerformAction action: UserView.Action) {
        switch action {
        case .printUserInfo(let name):
            print("Select user \(String(describing: name))")
        }
    }
}
