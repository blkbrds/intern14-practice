//
//  BaiTapViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/10/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class BaiTapViewController: UIViewController {

    @IBOutlet private var baiTaps: [UIButton]!
    
    let viewcontrollers: [UIViewController] = [AViewController(), LoginViewController(), Bai3ViewController(), Bai4ViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func customNavi() {
        title = "Exercise Navigation"
        navigationController?.navigationBar.backgroundColor = .lightGray
        for button in baiTaps {
            button.layer.cornerRadius = 50
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavi()
    }
    
    @IBAction private func baiTapButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(viewcontrollers[sender.tag], animated: true)
    }
}
