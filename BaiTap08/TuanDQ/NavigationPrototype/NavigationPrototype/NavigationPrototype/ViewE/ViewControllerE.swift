//
//  ViewControllerE.swift
//  NavigationPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ViewControllerE: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ViewControllerE"
    }

    @IBAction func doC_ButtonClick(_ sender: UIButton) {
        for viewController in navigationController!.viewControllers {
            if (viewController is ViewControllerC) {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    
    @IBAction func doB_ButtonClick(_ sender: UIButton) {
        for viewController in navigationController!.viewControllers {
            if (viewController is ViewControllerB) {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    @IBAction func doD_ButtonClick(_ sender: UIButton) {
        for viewController in navigationController!.viewControllers {
            if (viewController is ViewControllerD) {
                navigationController?.popToViewController(viewController, animated: true)
            }
        }
    }
    @IBAction func doRootButtonClick(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
