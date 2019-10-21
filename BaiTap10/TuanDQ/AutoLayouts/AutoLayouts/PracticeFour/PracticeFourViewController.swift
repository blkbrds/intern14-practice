//
//  PracticeFourViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/7/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PracticeFourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func practiceDisplayButtonClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(AlignThreeSquareViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(AlignThreeSquareAutosizeViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(SquaresEqualRangeViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(SquaresFixRangeViewController(), animated: true)
        default:
            navigationController?.pushViewController(SquaresAutoRangeViewController(), animated: true)
        }
    }
}
