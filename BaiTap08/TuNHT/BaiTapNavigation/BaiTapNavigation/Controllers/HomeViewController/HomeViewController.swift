//
//  HomeViewController.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/10/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NAVIGATION"
    }
    
    @IBAction func baiTap1TouchUpInside(_ sender: UIButton) {
        let viewController = BarA()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap2TouchUpInside(_ sender: UIButton) {
        let viewController = LoginViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap3TouchUpInside(_ sender: UIButton) {
        let viewController = Bai3HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap4TouchUpInside(_ sender: UIButton) {
    }
}
