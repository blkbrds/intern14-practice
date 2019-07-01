//
//  Ex01ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/26/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {
    
    @IBOutlet weak var dateTime: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func timeSetting(_ sender: UIButton) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss dd/MM/yyyy"
        sender.setTitle("\(dateFormatter.string(from: currentDate))", for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            print("\(position.x), \(position.y)")
        }
        timeSetting(dateTime)
    }
}
