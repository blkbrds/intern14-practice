//
//  ViewController_E.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ViewController_E: UIViewController {

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
            if controller.isKind(of: ViewController_D.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func bTouchUpInsidr(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: ViewController_B.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func cTouchUpInsidr(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: ViewController_C.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func rootTouchUpInsidr(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
