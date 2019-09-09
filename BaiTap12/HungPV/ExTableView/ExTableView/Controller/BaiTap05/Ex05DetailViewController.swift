//
//  Ex05DetailViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex05DetailViewController: UIViewController {
    
    var textName = String()
    
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex05 - Detail"
        navigationController?.navigationBar.backgroundColor = .cyan
        self.labelText.text = textName
    }
}
