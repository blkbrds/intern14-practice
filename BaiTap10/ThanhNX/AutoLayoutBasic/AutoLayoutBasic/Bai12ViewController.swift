//
//  Bai12ViewController.swift
//  AutoLayoutBasic
//
//  Created by PCI0008 on 8/7/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai12ViewController: UIViewController {

    @IBOutlet private var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
}
