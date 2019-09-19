//
//  ViewController_C.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ViewController_C: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var rootButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController C"
    }
    
    @IBAction func nextTouchUpInside(_ sender: UIButton) {
        let controller = ViewController_D()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func previousTouchUpInsidr(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller.isKind(of: ViewController_B.self) {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func rootTouchUpInsidr(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
