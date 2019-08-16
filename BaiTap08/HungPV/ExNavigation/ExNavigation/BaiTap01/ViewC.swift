//
//  VcCViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/7/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ViewC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View C"
        navigationController?.navigationBar.backgroundColor = .cyan
       
    }
    
    @IBAction private func turnNext(_ sender: UIButton) {
        navigationController?.pushViewController(ViewD(), animated: true)
    }
    
    @IBAction private func turnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func turnRoot(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is ViewA }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
    
}
