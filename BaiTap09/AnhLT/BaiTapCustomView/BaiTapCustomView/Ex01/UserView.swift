//
//  UserView.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/23/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    
    func view(_ view: UserView, needPerformAction action: UserView.Action)
}

class UserView: UIView {
    
    enum Action {
        case printUserInfo(userName: String?)
    }
    
    var userAvatar: UIImageView?
    var userName: UILabel?
    
    weak var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add user avatar
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        userAvatar = UIImageView(image: UIImage(named: "img1"))
        userAvatar?.frame = frame
        userAvatar?.contentMode = .scaleToFill
        userAvatar?.layer.borderWidth = 1
        addSubview(userAvatar!)
        
        // Add user name
        userName = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        userName?.text = "TuanAnh"
        userName?.textAlignment = .center
        userName?.backgroundColor = .blue
        userName?.textColor = .white
        addSubview(userName!)
        
        // Add button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(didClickInforButton), for: .touchUpInside)
        addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didClickInforButton() {
        print("Button did click")
        delegate?.view(self, needPerformAction: .printUserInfo(userName: userName?.text))
    }
}
