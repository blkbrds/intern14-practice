//
//  Detail03ViewController.swift
//  ExTableView
//
//  Created by PCI0010 on 9/5/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Detail03ViewController: UIViewController {
    
    var textName = String()
    
    @IBOutlet weak var detailLabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " Ex03 "
        navigationController?.navigationBar.backgroundColor = .cyan
        self.detailLabelText.text = textName
    }
}
