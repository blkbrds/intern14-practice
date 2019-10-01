//
//  EditInformationViewController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class EditInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func doCancelButtonClick(_ sender: Any) {
    }
    @IBAction func doDoneButtonClick(_ sender: Any) {
    }

    fileprivate func goBackToHomePage() {
        navigationController?.popViewController(animated: true)
    }
}
