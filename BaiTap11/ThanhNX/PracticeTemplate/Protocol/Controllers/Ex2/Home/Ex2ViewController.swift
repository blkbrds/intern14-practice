//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex2ViewController: BaseViewController {
    var users: [Avatar] = Avatar.dummyData()
    
    @IBOutlet private weak var imageScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Home"
        
    }
    
    override func setupData() {
        var xFrame: CGFloat = 35
        var yFrame: CGFloat = 30
        for i in 0..<users.count {
            let userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView
            userView?.frame = CGRect(x: xFrame, y: yFrame, width: 100, height: 150)
            userView?.delegate = self
            userView?.nameLabel.text = "\(users[i].name)"
            imageScrollView.addSubview(userView!)
            userView?.index = i
            userView?.tag = i
            xFrame += 120
            if xFrame >= UIScreen.main.bounds.width - 100 {
                xFrame = 35
                yFrame += 150
            }
        }
        imageScrollView.contentSize = CGSize(width: view.bounds.width, height: yFrame)
    }
}

extension Ex2ViewController: UserViewDelegate {
    func userView(_ view: UserView, needFor action: UserView.Action, index: Int) {
        switch action {
        case .disSelected:
            let detailVC = ProfileViewController()
            detailVC.delegate = self
            detailVC.index = index
            detailVC.user = users[index]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension Ex2ViewController: ProfileViewControllerDelegate {
    func detailView(_ view: ProfileViewController, index: Int, avatar: Avatar) {
        for view in imageScrollView.subviews {
            if view.tag == index {
                let userView = view as! UserView
                userView.avatarImageView.image = UIImage(named: users[index].imageName)
                userView.nameLabel.text = users[index].name
                break
            }
        }
    }
}
