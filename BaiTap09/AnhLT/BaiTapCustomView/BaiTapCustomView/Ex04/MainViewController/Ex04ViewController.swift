//
//  Ex04ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/26/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {
    private var emailButton: NotificationView?
    private var photoButton: NotificationView?
    private var friendButton: NotificationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailButton = NotificationView(frame: CGRect(x: (view.frame.maxX / 2) - 75, y: 250, width: 150, height: 80), 100, .bottomCenter)
        emailButton?.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        emailButton?.layer.cornerRadius = 10
        emailButton?.titleLabel?.text = "Email"
        view.addSubview(emailButton!)
        
        
        photoButton = NotificationView(frame: CGRect(x: (view.frame.maxX / 2) - 75, y: 400, width: 150, height: 80), 1, .bottomRight)
        photoButton?.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        photoButton?.layer.cornerRadius = 10
        photoButton?.titleLabel?.text = "Photos"
        view.addSubview(photoButton!)
        
        friendButton = NotificationView(frame: CGRect(x: (view.frame.maxX / 2) - 75, y: 550, width: 150, height: 80), 30, .bottomLeft)
        friendButton?.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        friendButton?.layer.cornerRadius = 10
        friendButton?.titleLabel?.text = "Friends"
        view.addSubview(friendButton!)
    }
    
    
}

