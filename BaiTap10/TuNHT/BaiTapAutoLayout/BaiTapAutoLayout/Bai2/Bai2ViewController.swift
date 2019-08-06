//
//  Bai2ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "2.1", style: .done, target: self, action: #selector(touchBarButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func touchBarButton() {
        let viewController = Bai2_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
