//
//  Ex01.swift
//  BaitapIBaction
//
//  Created by PCI0007 on 6/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex01: UIViewController {

    @IBOutlet weak var setTimeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        changeTime()
    }

    @IBAction func setTimeButtonTouchUpInside(_ button: UIButton) {
        print("Button clicked")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeTime()
    }
    
    func changeTime() {
        let currentDate = Date()
        let format = DateFormatter()
        format.dateFormat = "hh:mm:ss dd/MM/yyyy"
        setTimeButton.setTitle("\(format.string(from: currentDate))", for: .normal)
    }
}
