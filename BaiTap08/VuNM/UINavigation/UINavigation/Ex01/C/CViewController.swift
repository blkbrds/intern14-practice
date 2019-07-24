//
//  CViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/9/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
    
    @IBOutlet var navi2Button: [UIButton]!
    let d = DViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "C"
        for button in navi2Button {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 20
        }
        
    }
    
    @IBAction func navi2ButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            navigationController?.pushViewController(d, animated: true)
        } else if sender.tag == 1 {
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
