//
//  Ex03ViewController.swift
//  ExAutoLayout
//
//  Created by PCI0010 on 8/28/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex03 "
        let barButton = UIBarButtonItem(title: "3.1", style: .done, target: self, action: #selector(touchBarButton))
        let bar2Button = UIBarButtonItem(title: "3.2", style: .done, target: self, action: #selector(touchBarButton))
        navigationItem.rightBarButtonItems = [barButton, bar2Button]
    }
    
    @objc func touchBarButton() {
        let viewController = Ex03_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func touchBarButton2() {
        let viewController = Ex03_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
