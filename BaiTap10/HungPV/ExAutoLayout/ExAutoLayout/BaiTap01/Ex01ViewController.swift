//
//  Ex01ViewController.swift
//  ExAutoLayout
//
//  Created by PCI0010 on 8/27/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex01 "
        let barButton = UIBarButtonItem(title: "1.1", style: .done, target: self, action: #selector(touchBarButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func touchBarButton() {
        let viewController = Ex01_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}
