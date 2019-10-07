//
//  PracticeThreeViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/7/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PracticeThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func alignRectangleClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(SquaresAlignCenterViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(SquaresAlignCenterAutoSizeViewController(), animated: true)
        default:
            navigationController?.pushViewController(SquaresAlignCenterViewController(), animated: true)
        }
    }

}
