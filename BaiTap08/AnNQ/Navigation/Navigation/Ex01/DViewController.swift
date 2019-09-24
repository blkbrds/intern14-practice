//
//  ViewController_D.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var rootButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ViewController D"
    }
    
    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        let controller = EViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func bTouchUpInsidr(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: BViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func cTouchUpInsidr(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: BViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func rootTouchUpInsidr(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
