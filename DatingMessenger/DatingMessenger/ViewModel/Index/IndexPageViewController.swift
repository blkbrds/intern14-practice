//
//  IndexPageViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/19/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class IndexPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func goHomeButtonClick(_ sender: UIButton) {
        UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = TabbarViewController()
    }
}
