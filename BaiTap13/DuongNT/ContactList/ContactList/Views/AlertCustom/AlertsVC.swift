//
//  AlertsVC.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/19/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class AlertsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func alertSettings(title: String, message: String, alertButtons: [AlertButton]) {
        let alert = UIAlertController(title: "Delete Warning",
                                      message: "Do you want to delete this rows selected!",
                                      preferredStyle: UIAlertController.Style.alert)

        for button in alertButtons {
            switch button.style {
            case .cancel:
                alert.addAction(UIAlertAction(title: button.name,
                                              style: UIAlertAction.Style.cancel,
                                              handler: {(alert: UIAlertAction!) in button.handle}))
            case .defauls:
                alert.addAction(UIAlertAction(title: button.name,
                                              style: UIAlertAction.Style.default,
                                              handler: {(alert: UIAlertAction!) in button.handle}))
            }
            
        }
        self.present(alert, animated: true)
    }
}
