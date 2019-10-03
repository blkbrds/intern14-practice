//
//  MainViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MainViewController"
    }
    @IBAction func sliderButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(MySliderViewController(), animated: true)
    }
    @IBAction func advanceSliderButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(AdvanceSliderViewController(), animated: true)
    }
    @IBAction func badgeButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(MyBadgeViewController(), animated: true)
    }
}
