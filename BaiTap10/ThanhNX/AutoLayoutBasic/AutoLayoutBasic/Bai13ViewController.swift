//
//  Bai13ViewController.swift
//  AutoLayoutBasic
//
//  Created by PCI0008 on 8/9/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai13ViewController: UIViewController {
    @IBOutlet private weak var avatarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarView.layer.borderWidth = 5
        avatarView.layer.borderColor = UIColor.yellow.cgColor
        avatarView.layer.cornerRadius = avatarView.bounds.height / 2
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        navigationController?.navigationBar.isHidden = true
    }
}
