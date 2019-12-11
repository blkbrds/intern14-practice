//
//  Ex04ViewController.swift
//  CustomView
//
//  Created by MBA0217 on 9/30/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var friendsView: UIView!
    @IBOutlet weak var photosView: UIView!
    
    var emailButton = ButtonView.loadNibNamed()
    var friendsButton = ButtonView.loadNibNamed()
    var photosButton = ButtonView.loadNibNamed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    func setupUI () {
        emailButton.setupView(name: "Email", color: .white, backGrC: UIColor(red: 131 / 255, green: 234 / 255, blue: 44 / 255, alpha: 1), badge: 10, position: .topLeft)
        emailView.addSubview(emailButton)

        friendsButton.setupView(name: "Friends", color: .white, backGrC: .yellow, badge: 100, position: .topRight)
        friendsView.addSubview(friendsButton)

        photosButton.setupView(name: "Photos", color: .white, backGrC: .purple, badge: 8, position: .topCenter)
        photosView.addSubview(photosButton)
    }
}
