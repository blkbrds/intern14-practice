//
//  HomeViewController.swift
//  ExProtocol
//
//  Created by PCI0010 on 9/4/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var allButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        for button in allButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 20
        }
    }
    
    let viewController: [UIViewController] = [Ex01ViewController(),Ex03ViewController(),Ex04ViewController()]
    
    @IBAction private func exNavi(_ sender: UIButton) {
        navigationController?.pushViewController(viewController[sender.tag], animated: true)
    }
}


