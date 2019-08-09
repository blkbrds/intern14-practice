//
//  HomeViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var baiTapButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AutoLayout"
    }
    
    @IBAction func baiTapButtonTouchUpInside(_ button: UIButton) {
        if button == baiTapButton[0] {
            let viewController = Bai1ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[1] {
            let viewController = Bai2ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[2] {
            let viewController = Bai3ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[3] {
            let viewController = Bai4ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[4] {
            let viewController = Bai5ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[5] {
            let viewController = Bai6ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[6] {
            let viewController = Bai7ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[7] {
            let viewController = Bai8ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[8] {
            let viewController = Bai9ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[9] {
            let viewController = Bai10ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[10] {
            let viewController = Bai11ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        } else if button == baiTapButton[11] {
            let viewController = Bai12ViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
