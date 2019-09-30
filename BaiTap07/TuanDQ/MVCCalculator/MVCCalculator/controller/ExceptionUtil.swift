//
//  ExceptionUtil.swift
//  MVCCalculator
//
//  Created by MBA0051 on 9/30/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit
class ExceptionUtil {
    public func showMessage(message content: String) -> UIAlertController {
        // create the alert
        let alert = UIAlertController(title: "Error message", message: content, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
}
