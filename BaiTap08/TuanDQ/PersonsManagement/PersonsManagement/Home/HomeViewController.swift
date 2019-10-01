//
//  HomeViewController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doLogoutButtonClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func doEditButtonClick(_ sender: Any) {
        let editInformation = EditInformationViewController()
        navigationController?.pushViewController(editInformation, animated: true)
    }
}
