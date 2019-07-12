//
//  Baitap1.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/9/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BarA: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController A"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let viewController = BarB()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
