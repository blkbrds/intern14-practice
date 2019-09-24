//
//  ViewController_E.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class EViewController: UIViewController {

    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var rootButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ViewController E"
    }
    
    @IBAction func dTouchUpInside(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: DViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
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
            if controller.isKind(of: CViewController.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func rootTouchUpInsidr(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
