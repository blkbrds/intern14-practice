//
//  VcBViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/7/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ViewB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View B"
        navigationController?.navigationBar.backgroundColor = .cyan
    
    }

    @IBAction private func turnNext(_ sender: UIButton) {
        navigationController?.pushViewController(VcC(), animated: true)
    }
    @IBAction private func turnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
  

}
