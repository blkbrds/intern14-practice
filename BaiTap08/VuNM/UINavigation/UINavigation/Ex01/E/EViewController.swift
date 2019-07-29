//
//  EViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/10/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit


class EViewController: UIViewController {

    
    @IBOutlet var navi4Button: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in navi4Button {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 20
        }


    }

    @IBAction func naviButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            guard let viewController = navigationController?.viewControllers.first(where: { $0 is BViewController }) else { return }
            navigationController?.popToViewController(viewController, animated: true)
        } else if sender.tag == 1 {
            guard let viewController = navigationController?.viewControllers.first(where: { $0 is CViewController }) else { return }
            navigationController?.popToViewController(viewController, animated: true)
        } else if sender.tag == 2 {
            navigationController?.popViewController(animated: true)
        } else {
            navigationController?.popToRootViewController(animated: true)
        }

    }


}
