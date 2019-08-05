//
//  Bai1ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai1ViewController: UIViewController {
    struct Config {
        static let avatarWidth: CGFloat = 100
        static let avatarHeight: CGFloat = 140
    }
    
    @IBOutlet private weak var avatarScrollView: UIScrollView!
    var avatars: [Avatar] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avatarScrollView.subviews.forEach { view in view.removeFromSuperview() }
        configAvatar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configAvatar() {
        avatars = Avatar.parseImage(array: FileManagers.readPlistFile(filename: "avatar"))
        var xFrame: CGFloat = 35
        var yFrame: CGFloat = 30
        for index in 0..<avatars.count {
            let avatar = MyAvatar(frame: CGRect(x: xFrame, y: yFrame, width: Config.avatarWidth, height: Config.avatarHeight), userName: avatars[index].name, imageName: avatars[index].imageName)
            avatar.delegate = self
            avatarScrollView.addSubview(avatar)
            
            xFrame += 120
            if xFrame >= UIScreen.main.bounds.width - Config.avatarWidth {
                xFrame = 35
                yFrame += 150
            }
        }
        avatarScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 800)
    }
}

extension Bai1ViewController: MyAvatarDelegate {
    func view(_ view: MyAvatar, needPerformAction action: MyAvatar.Action) {
        switch action {
        case .getAvatar(let avatar):
            let VC = ProfileViewController()
            VC.avatar1 = avatar
            navigationController?.pushViewController(VC, animated: true)
        }
    }
}
