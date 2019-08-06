//
//  Bai1ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "1.1", style: .done, target: self, action: #selector(touchBarButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func touchBarButton() {
        let viewController = Bai1_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
