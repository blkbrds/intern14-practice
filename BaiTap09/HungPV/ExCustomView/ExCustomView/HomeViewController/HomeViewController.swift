//
//  HomeViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var allButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Home "
        navigationController?.navigationBar.backgroundColor = .cyan
        for button in allButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 20
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    let viewController: [UIViewController] = [Ex01ViewController(),Ex02ViewController(),Ex03ViewController(),Ex04ViewController(),Ex05ViewController(),Ex06ViewController()]
    
    @IBAction private func exCustomView(_ sender: UIButton) {
        navigationController?.pushViewController(viewController[sender.tag], animated: true)
    }
    
}
