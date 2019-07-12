//
//  BViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/9/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 50
        }
        title = "Navigation B"
        navigationController?.navigationBar.backgroundColor = .orange
    }

    @IBAction private func nextButtonTouchUpInside(_ sender: UIButton) {
        let nextViewController = CViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    @IBAction private func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
