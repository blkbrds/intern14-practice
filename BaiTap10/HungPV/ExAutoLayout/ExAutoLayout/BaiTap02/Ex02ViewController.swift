//
//  Ex02ViewController.swift
//  ExAutoLayout
//
//  Created by PCI0010 on 8/27/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex02 "
        let barButton = UIBarButtonItem(title: "2.1", style: .done, target: self, action: #selector(touchBarButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func touchBarButton() {
        let viewController = Ex02_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
