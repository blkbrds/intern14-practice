//
//  Bai6ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "6.1", style: .done, target: self, action: #selector(touchBarButton))
        let bar2Button = UIBarButtonItem(title: "6.2", style: .done, target: self, action: #selector(touchBar2Button))
        let bar3Button = UIBarButtonItem(title: "6.3", style: .done, target: self, action: #selector(touchBar3Button))
        let bar4Button = UIBarButtonItem(title: "6.4", style: .done, target: self, action: #selector(touchBar4Button))
        navigationItem.rightBarButtonItems = [barButton, bar2Button, bar3Button, bar4Button]
    }
    
    @objc func touchBarButton() {
        let viewController = Bai6_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar2Button() {
        let viewController = Bai6_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar3Button() {
        let viewController = Bai6_3ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar4Button() {
        let viewController = Bai6_4ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
