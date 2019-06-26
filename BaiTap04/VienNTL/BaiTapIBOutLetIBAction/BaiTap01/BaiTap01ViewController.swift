//
//  BaiTap01ViewController.swift
//  BaiTapIBOutLetIBAction
//
//  Created by Nguyen Truong Lam Vien on 6/25/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap01ViewController: UIViewController {

    @IBOutlet weak var dateTimeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeTime(_ button: UIButton) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss dd/MM/yyyy"
        button.setTitle("\(formatter.string(from: currentDateTime))", for: .normal)
    }
    
    //Touch Event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touch Began")
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            print("\(position.x),\(position.y)")
        }
        changeTime(dateTimeButton)
    }
}