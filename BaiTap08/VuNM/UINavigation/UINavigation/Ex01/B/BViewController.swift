//
//  BViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/9/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    @IBOutlet var naviButton: [UIButton]!

    
    let c = CViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "B"
        for button in naviButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 20
        }
       
    }
    
    func adjustButton() {
        for button in naviButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 20
        }
    }


    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(c, animated: true)
    }
    
    @IBAction func backButtonTouchupInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
