//
//  ViewControllerA.swift
//  NavigationPrototype
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "ViewControllerA"
    }
    @IBAction func doNextButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(ViewControllerB(), animated: true)
    }
}
