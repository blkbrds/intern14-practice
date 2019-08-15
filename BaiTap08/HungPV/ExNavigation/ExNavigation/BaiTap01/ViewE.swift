//
//  VcEViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/7/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ViewE: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View E"
        navigationController?.navigationBar.backgroundColor = .cyan
        
    }
    
    @IBAction func turnC(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is ViewC }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
    
    @IBAction func turnB(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is ViewB }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
    
    @IBAction func turnD(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func turnRoot(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is ViewA }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
}
