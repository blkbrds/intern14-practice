//
//  ViewControllerB.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/9/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BarB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController B"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let viewController = BarC()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
