//
//  BaiTap01ViewController.swift
//  BaiTapIBOutLetIBAction
//
//  Created by Nguyen Truong Lam Vien on 6/25/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap01ViewController: UIViewController {

    @IBOutlet private weak var dateTimeButtonTouchUpInside: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func changeTime(_ button: UIButton) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss dd/MM/yyyy"
        button.setTitle("\(formatter.string(from: currentDateTime))", for: .normal)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            print("\(position.x),\(position.y)")
        }
        changeTime(dateTimeButtonTouchUpInside)
    }
}
