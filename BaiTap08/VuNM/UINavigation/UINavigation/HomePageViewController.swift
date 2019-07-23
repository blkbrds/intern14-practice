//
//  HomePageViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/23/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet var exButtons: [UIButton]!
    let ex01 = AViewController()
    let ex02 = LoginViewController()
    let ex03 = Ex03ViewController()
    let ex04 = Bar1ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home Page"

    }

    @IBAction func exButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            navigationController?.pushViewController(ex01, animated: true)
        } else if sender.tag == 1 {
            navigationController?.pushViewController(ex02, animated: true)
        } else if sender.tag == 2 {
            navigationController?.pushViewController(ex03, animated: true)
        } else if sender.tag == 3 {
            navigationController?.pushViewController(ex04, animated: true)
        }
    }
    

}
