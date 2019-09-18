//
//  HomeViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
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
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    let viewController: [UIViewController] = [Ex01ViewController(),Ex02ViewController(),Ex03ViewController(),Ex04ViewController(),Ex05ViewController(),Ex07ViewController(),Ex08ViewController(),Ex09ViewController(),Ex10ViewController(),Ex11ViewController()]
    @IBAction private func exTouchEvent(_ sender: UIButton) {
        navigationController?.pushViewController(viewController[sender.tag], animated: true)
    }
    
    
}
