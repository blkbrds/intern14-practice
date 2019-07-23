//
//  ViewControllerD.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/9/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    @IBOutlet weak var rootButton: UIButton!
    @IBOutlet weak var backToBButton: UIButton!
    @IBOutlet weak var backToCButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .red
        title = "Viewcontroller D"
    }
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let homeViewController = EViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    @IBAction func backToCButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backToBButtonTouchUpInside(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: BViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    @IBAction func backToRootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
