//
//  HomeViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/22/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CUSTOM VIEW"
    }
    
    @IBAction func baiTap1TouchUpInside(_ sender: UIButton) {
        let viewController = Bai1ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap2TouchUpInside(_ sender: UIButton) {
        let viewController = Bai2ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap3TouchUpInside(_ sender: UIButton) {
        let viewController = Bai3ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap4TouchUpInside(_ sender: UIButton) {
        let viewController = Bai4ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap5TouchUpInside(_ sender: UIButton) {
        let viewController = PickerViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func baiTap6TouchUpInside(_ sender: UIButton) {
        let viewController = Bai6ViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
