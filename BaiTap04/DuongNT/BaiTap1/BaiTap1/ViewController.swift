//
//  ViewController.swift
//  BaiTap1
//
//  Created by Nguyen Duong on 6/27/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTime(dateTimeLabel)
    }
    
    @IBAction func changeTime(_ label: UILabel) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss dd/MM/yyyy"
        label.text = formatter.string(from: currentDateTime)
        label.textColor = .red
        label.textAlignment = .center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeTime(dateTimeLabel)
    }
}
