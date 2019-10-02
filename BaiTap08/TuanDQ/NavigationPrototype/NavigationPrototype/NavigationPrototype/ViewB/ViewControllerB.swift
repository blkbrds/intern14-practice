//
//  ViewControllerB.swift
//  NavigationPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ViewControllerB"
    }

    @IBAction func doNextButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(ViewControllerC(), animated: true)
    }
    @IBAction func doPreButtonClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
