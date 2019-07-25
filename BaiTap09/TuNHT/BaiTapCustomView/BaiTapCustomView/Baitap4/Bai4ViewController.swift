//
//  Bai4ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai4ViewController: UIViewController {
    private var emailButton: ButtonView?
    private var friendButton: ButtonView?
    private var photoButton: ButtonView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailButton = ButtonView(frame: CGRect(x: 130, y: 200, width: 150, height: 100))
        emailButton?.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        emailButton?.layer.cornerRadius = 10
        view.addSubview(emailButton!)
        
        friendButton = ButtonView(frame: CGRect(x: 130, y: 330, width: 150, height: 100))
        friendButton?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        friendButton?.layer.cornerRadius = 10
        view.addSubview(friendButton!)
        
        photoButton = ButtonView(frame: CGRect(x: 130, y: 460, width: 150, height: 100))
        photoButton?.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        photoButton?.layer.cornerRadius = 10
        view.addSubview(photoButton!)
    }
}
