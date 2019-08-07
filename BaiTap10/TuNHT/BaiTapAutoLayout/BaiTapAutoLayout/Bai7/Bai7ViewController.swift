//
//  Bai7ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/5/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIBarButtonItem(title: "7.1", style: .done, target: self, action: #selector(touchBarButton))
        let bar2Button = UIBarButtonItem(title: "7.2", style: .done, target: self, action: #selector(touchBar2Button))
        let bar3Button = UIBarButtonItem(title: "7.3", style: .done, target: self, action: #selector(touchBar3Button))
        let bar4Button = UIBarButtonItem(title: "7.4", style: .done, target: self, action: #selector(touchBar4Button))
        navigationItem.rightBarButtonItems = [barButton, bar2Button, bar3Button, bar4Button]
    }
    
    @objc func touchBarButton() {
        let viewController = Bai7_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar2Button() {
        let viewController = Bai7_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar3Button() {
        let viewController = Bai7_3ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func touchBar4Button() {
        let viewController = Bai7_4ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
