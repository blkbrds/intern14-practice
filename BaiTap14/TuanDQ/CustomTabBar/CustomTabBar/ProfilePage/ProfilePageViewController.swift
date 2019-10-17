//
//  ProfilePageViewController.swift
//  CustomTabBar
//
//  Created by MBA0051 on 10/17/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutButtonClick(_ sender: UIButton) {
        
        let alertMessage = UIAlertController(title: "Log out warning!", message: "Are you want to logout?", preferredStyle: .alert)

        alertMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Cancel button are clicked.")
            alertMessage.dismiss(animated: true, completion: nil)
        }))
        alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            let indexPage = IndexPageViewController()
            UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = indexPage
        }))
        
        self.present(alertMessage, animated: true, completion: nil)
    }
}
