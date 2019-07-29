//
//  ViewControllerE.swift
//  BaiTapNavigation
//
//  Created by PCI0001 on 7/9/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BarE: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController E"
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    @IBAction func cButtonTouchUpInside(_ sender: UIButton) {
        for viewController in self.navigationController!.viewControllers as Array {
            if viewController.isKind(of: BarC.self) {
                self.navigationController!.popToViewController(viewController, animated: true)
                break
            }
        }
    }
    
    @IBAction func bButtonTouchUpInside(_ sender: UIButton) {
        for viewController in self.navigationController!.viewControllers as Array {
            if viewController.isKind(of: BarB.self) {
                self.navigationController!.popToViewController(viewController, animated: true)
                break
            }
        }
    }
    
    @IBAction func dButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: UIButton) {
        for viewController in self.navigationController!.viewControllers as Array {
            if viewController.isKind(of: BarA.self) {
                self.navigationController!.popToViewController(viewController, animated: true)
                break
            }
        }
    }
}
