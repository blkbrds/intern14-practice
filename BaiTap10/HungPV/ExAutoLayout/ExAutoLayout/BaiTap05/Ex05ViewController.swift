//
//  Ex05ViewController.swift
//  ExAutoLayout
//
//  Created by PCI0010 on 8/28/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex05ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex05 "
        let barButton1 = UIBarButtonItem(title: "5.1", style: .done, target: self, action: #selector(touchBarButton1))
        let barButton2 = UIBarButtonItem(title: "5.2", style: .done, target: self, action: #selector(touchBarButton2))
        let barButton3 = UIBarButtonItem(title: "5.3", style: .done, target: self, action: #selector(touchBarButton3))
        let barButton4 = UIBarButtonItem(title: "5.4", style: .done, target: self, action: #selector(touchBarButton4))
        navigationItem.rightBarButtonItems = [barButton1, barButton2, barButton3, barButton4]
        // Do any additional setup after loading the view.
    }

    @objc func touchBarButton1() {
        let viewController = Ex05_1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func touchBarButton2() {
        let viewController = Ex05_2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func touchBarButton3() {
        let viewController = Ex05_3ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func touchBarButton4() {
        let viewController = Ex05_4ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}
