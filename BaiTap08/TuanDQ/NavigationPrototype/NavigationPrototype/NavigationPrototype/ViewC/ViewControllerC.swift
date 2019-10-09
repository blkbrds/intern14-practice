//
//  ViewControllerC.swift
//  NavigationPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ViewControllerC"
    }

    @IBAction func doNextButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(ViewControllerD(), animated: true)
    }
    
    @IBAction func doPreButtonClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doRootButtonClick(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
