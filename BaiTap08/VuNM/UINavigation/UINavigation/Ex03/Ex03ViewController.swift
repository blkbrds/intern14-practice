//
//  Ex03ViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/12/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit


class Ex03ViewController: UIViewController {
    
    let path = HandlePlist.shared.plistInDocument
    var arr: [[String: String]]? {
        return NSArray(contentsOfFile: path) as? [[String: String]]
    }
    var user: [UserNameAndAvatar] {
        return UserNameAndAvatar.parseDataOfNameAndAvatar(arr ?? [])
    }
    
    @IBOutlet weak var userScrollview: UIScrollView!
    
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        add()
        userScrollview.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 800)
        title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userScrollview.subviews.forEach { view in
            view.removeFromSuperview()
        }
        add()
    }
    
    private func add() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for i in 0..<user.count{
            let image = UIImage(named: "avatar\(i)")
            let frame = CGRect(x: x, y: y, width: (view.frame.width - 80) / 3, height: 120)
            let userView = UserView(frame, user[i].name, image!, tag: i)
            userView.delegate = self
            userView.tag = i
            userScrollview.addSubview(userView)
            x += (view.frame.width - 80) / 3 + 20
            if x >= view.frame.width - 20 {
                x = 20
                y += 150
            }
        }
    }
}

extension Ex03ViewController: UserViewDelegate {
    
    func view(_ view: UserView, needPerformAction action: UserView.Action) {
        switch action {
        case .pushToUserDetail:
            let vc = UserDetailViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .printTag(let tag):
            print(tag)
        }
    }
}
