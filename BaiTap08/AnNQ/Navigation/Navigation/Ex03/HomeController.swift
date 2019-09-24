//
//  HomeController.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    var users: [User] = User.parsingData()
    @IBOutlet weak var uiScrollView: UIScrollView!
    var profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        profileVC.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configUI () {
        title = "Home"
        showListUser()
    }
    
    func showListUser () {
        var x: CGFloat = 12
        var y: CGFloat = 10
        for i in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 120, height: 130)
            let userView = UserView(frame: frame, user: users[i])
            userView.tag = i
            tapGestureRecognizer(userView)
            uiScrollView.addSubview(userView)
            x += 135
            if x >= UIScreen.main.bounds.width {
                x = 10
                y += 160 + 10
            }
        }
    }
    
    private func tapGestureRecognizer(_ container: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userProfiletapGestureRecognizer(_:)))
        container.addGestureRecognizer(tapGesture)
        container.isUserInteractionEnabled = true
    }
    
    @objc private func userProfiletapGestureRecognizer(_ sender : UITapGestureRecognizer ) {
        guard sender.view != nil else { return }

        if sender.state == .ended {
//            let profiteController = ProfileViewController()
            guard let index = sender.view?.tag else {
                return
            }
            profileVC.user = users[index]
            profileVC.index = index
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
}

extension HomeController : ProfileViewControllerDelegate {
    func changeDataInUIVIew(value: User, index: Int) {
        let userView = uiScrollView.viewWithTag(index) as! UserView
        userView.nameLabel!.text = value.name
        userView.avatarImageView!.image = UIImage(named: value.avatar)
    }    
}
