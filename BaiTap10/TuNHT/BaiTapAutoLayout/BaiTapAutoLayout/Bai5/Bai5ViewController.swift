//
//  Bai5ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "5.1", style: .done, target: self, action: #selector(touchBarButton))
        let bar2Button = UIBarButtonItem(title: "5.2", style: .done, target: self, action: #selector(touchBar2Button))
        let bar3Button = UIBarButtonItem(title: "5.3", style: .done, target: self, action: #selector(touchBar3Button))
        let bar4Button = UIBarButtonItem(title: "5.4", style: .done, target: self, action: #selector(touchBar4Button))
        navigationItem.rightBarButtonItems = [barButton, bar2Button, bar3Button, bar4Button]
    }
    
    @objc func touchBarButton() {
        let viewController = Bai5_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar2Button() {
        let viewController = Bai5_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar3Button() {
        let viewController = Bai5_3ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar4Button() {
        let viewController = Bai5_4ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
