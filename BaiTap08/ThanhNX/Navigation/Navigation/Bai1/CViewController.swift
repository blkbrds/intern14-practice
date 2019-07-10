//
//  CViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/9/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 50
        }
        title = "Navigation C"
        navigationController?.navigationBar.backgroundColor = .red
    }

    @IBAction func nextButtonTouchUpInside(_ sender: UIButton) {
        let navi = DViewController()
        navigationController?.pushViewController(navi, animated: true)
    }
    @IBAction func preButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func rootButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
