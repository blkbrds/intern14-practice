//
//  PracticeTwoViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/7/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PracticeTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Center rectangle"
    }

    @IBAction func rectangleChangeSizeClick(_ sender: UIButton) {
        if (sender.tag == 1) {
            navigationController?.pushViewController(RectangleFixSizeViewController(), animated: true)
        } else {
            navigationController?.pushViewController(RectangleAutoSizeViewController(), animated: true)
        }
    }

}
