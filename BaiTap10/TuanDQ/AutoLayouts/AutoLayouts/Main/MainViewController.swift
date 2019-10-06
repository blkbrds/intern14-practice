//
//  MainViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/6/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func displayAutoLayoutClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(CenterSquareViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(CenterSquareAutoSizeViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(RectangleFixSizeViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(RectangleAutoSizeViewController(), animated: true)
        case 5:
            navigationController?.pushViewController(SquaresAlignCenterViewController(), animated: true)
        case 6:
            navigationController?.pushViewController(SquaresAlignCenterAutoSizeViewController(), animated: true)
        default:
            print("Nothing happen")
        }
    }
}
