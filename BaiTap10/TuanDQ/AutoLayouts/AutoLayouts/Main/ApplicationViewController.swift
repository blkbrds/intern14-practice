//
//  ApplicationViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/7/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func movePracticeButtonClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(PracticeOneViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(PracticeTwoViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(PracticeThreeViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(PracticeFourViewController(), animated: true)
        case 5:
            navigationController?.pushViewController(PracticeFiveViewController(), animated: true)
        case 6:
            navigationController?.pushViewController(PracticeSixViewController(), animated: true)
        case 7:
            navigationController?.pushViewController(PracticeSevenViewController(), animated: true)
        case 8:
            navigationController?.pushViewController(PracticeEightViewController(), animated: true)
        case 9:
            navigationController?.pushViewController(PracticeNineViewController(), animated: true)
        default:
            print("Please re-view your actions.")
        }
    }
    
}
