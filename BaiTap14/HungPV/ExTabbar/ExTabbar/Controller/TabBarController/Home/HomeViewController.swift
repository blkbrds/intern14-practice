//
//  HomeViewController.swift
//  ExTabbar
//
//  Created by PCI0010 on 9/10/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Home "
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "id") {
            labelText.text = name
        }
    }
}
