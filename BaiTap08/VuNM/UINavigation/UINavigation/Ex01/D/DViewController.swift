//
//  DViewController.swift
//  DemoNavi
//
//  Created by PCI0007 on 7/9/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    @IBOutlet var navi3Button: [UIButton]!
    let e = EViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "D"
        for button in navi3Button {
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
            navigationController?.popViewController(animated: true)
        } else if sender.tag == 2 {
            navigationController?.pushViewController(e, animated: true)
        } else if sender.tag == 3 {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    

}
