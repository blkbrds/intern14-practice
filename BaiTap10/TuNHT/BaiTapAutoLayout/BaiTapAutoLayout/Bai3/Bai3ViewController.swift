//
//  Bai3ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "3.1", style: .done, target: self, action: #selector(touchBarButton))
        let bar2Button = UIBarButtonItem(title: "3.2", style: .done, target: self, action: #selector(touchBar2Button))
        navigationItem.rightBarButtonItems = [barButton, bar2Button]
    }
    
    @objc func touchBarButton() {
        let viewController = Bai3_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar2Button() {
        let viewController = Bai3_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
