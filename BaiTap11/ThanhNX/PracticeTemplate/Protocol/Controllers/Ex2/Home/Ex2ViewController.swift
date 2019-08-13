//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

final class Ex2ViewController: BaseViewController {
    
    var userData: [Avatar] = [Avatar(imageName: "ic-ava", name: "Thanh1"),
                            Avatar(imageName: "ic-ava", name: "Thanh2"),
                            Avatar(imageName: "ic-ava", name: "Thanh3"),
                            Avatar(imageName: "ic-ava", name: "Thanh4"),
                            Avatar(imageName: "ic-ava", name: "Thanh5"),
                            Avatar(imageName: "ic-ava", name: "Thanh6"),
                            Avatar(imageName: "ic-ava", name: "Thanh7"),
                            Avatar(imageName: "ic-ava", name: "Thanh8"),
                            Avatar(imageName: "ic-ava", name: "Thanh9"),
                            Avatar(imageName: "ic-ava", name: "Thanh10"),
                            Avatar(imageName: "ic-ava", name: "Thanh11"),
                            Avatar(imageName: "ic-ava", name: "Thanh12"),
                            Avatar(imageName: "ic-ava", name: "Thanh13"),
                            Avatar(imageName: "ic-ava", name: "Thanh14"),
                            Avatar(imageName: "ic-ava", name: "Thanh15"),
                            Avatar(imageName: "ic-ava", name: "Thanh16"),
                            Avatar(imageName: "ic-ava", name: "Thanh17"),
                            Avatar(imageName: "ic-ava", name: "Thanh18"),
                            Avatar(imageName: "ic-ava", name: "Thanh19"),
                            Avatar(imageName: "ic-ava", name: "Thanh20"),
                            Avatar(imageName: "ic-ava", name: "Thanh21"),
                            Avatar(imageName: "ic-ava", name: "Thanh22"),
                            Avatar(imageName: "ic-ava", name: "Thanh23"),
                            Avatar(imageName: "ic-ava", name: "Thanh24"),
                            Avatar(imageName: "ic-ava", name: "Thanh25"),
                            Avatar(imageName: "ic-ava", name: "Thanh26"),
                            Avatar(imageName: "ic-ava", name: "Thanh27"),
                            Avatar(imageName: "ic-ava", name: "Thanh28"),
                            Avatar(imageName: "ic-ava", name: "Thanh29"),
                            Avatar(imageName: "ic-ava", name: "Thanh30"),
                            Avatar(imageName: "ic-ava", name: "Thanh31"),
                            Avatar(imageName: "ic-ava", name: "Thanh32"),
                            Avatar(imageName: "ic-ava", name: "Thanh33")]
    
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
        for i in 0..<userData.count {
            let userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView
            userView?.frame = CGRect(x: xFrame, y: yFrame, width: 100, height: 150)
            userView?.delegate = self
            userView?.nameLabel.text = "\(userData[i].name)"
            imageScrollView.addSubview(userView!)
            userView?.index = i
            userView?.tag = i
            xFrame += 120
            if xFrame >= UIScreen.main.bounds.width - 100 {
                xFrame = 35
                yFrame += 150
            }
        }
        guard yFrame > view.bounds.height else { return }
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
            detailVC.user = userData[index]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension Ex2ViewController: ProfileViewControllerDelegate {
    func detailView(_ view: ProfileViewController, index: Int, avatar: Avatar) {
        userData[index] =  userData[index]
        
        for view in imageScrollView.subviews {
            if view.tag == index {
                let userView = view as! UserView
                userView.avatarImageView.image = UIImage(named: userData[index].imageName)
                userView.nameLabel.text = userData[index].name
                break
            }
        }
    }
}
