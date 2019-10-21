//
//  CustomNotificationViewController.swift
//  CustomTabBar
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CustomNotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeNotificationButtonClick(_ sender: UIButton) {
        // Close notification.
        self.dismiss(animated: true, completion: nil)
    }
}
