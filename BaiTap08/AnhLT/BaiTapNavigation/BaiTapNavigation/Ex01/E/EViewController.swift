//
//  ViewControllerE.swift
//  BaiTapNavigation
//
//  Created by PCI0013 on 7/9/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class EViewController: UIViewController {

    @IBOutlet weak var backCButton: UIButton!
    @IBOutlet weak var backBButton: UIButton!
    @IBOutlet weak var backDButton: UIButton!
    @IBOutlet weak var backRootButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .red
        title = "Viewcontroller E"
    }
    @IBAction func backToCButtonTouchUpInSide(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: CViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    @IBAction func backToBButtonTouchUpInside(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: BViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func backToDButtonTouchUpInside(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: DViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func backToRootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
