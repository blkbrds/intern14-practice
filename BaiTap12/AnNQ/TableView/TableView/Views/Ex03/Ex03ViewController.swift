//
//  Ex03ViewController.swift
//  TableView
//
//  Created by MBA0217 on 10/8/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    var name: String?
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Exercise 3"
        nameLabel.text = name
    }
}
