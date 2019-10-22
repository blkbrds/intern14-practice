//
//  MapPageViewController.swift
//  CustomTabBar
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MapPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let alertMessage = UIAlertController(title: "Not complete yet", message: "This function is not complete yet. Please wait...", preferredStyle: .alert)

        alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))

        self.present(alertMessage, animated: true, completion: nil)
    }
    
}
