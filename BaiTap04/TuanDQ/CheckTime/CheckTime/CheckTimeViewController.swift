//
//  CheckTimeViewController.swift
//  CheckTime
//
//  Created by MBA0051 on 9/26/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CheckTimeViewController: UIViewController {

    @IBOutlet weak var checkTimeButton: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkTimeButton.setTitle(nil, for: .normal)
        checkTimeButton.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        checkTimeButton.backgroundColor = .clear
        checkTimeButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        
        currentTimeLabel.text = getCurrentDateTime()
    }

    private func getCurrentDateTime() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:SS d-M-yyyy"
        return formatter.string(from: currentDateTime)
    }
    
    /**
     * Change date and time when touch inside.
     */
    @objc func buttonTouchUpInside(_ sender: UIButton) {
        currentTimeLabel.text = getCurrentDateTime()
    }

}
