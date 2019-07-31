//
//  BaiTap1ViewController.swift
//  BaiTapIB
//
//  Created by PCI0010 on 7/29/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap1ViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet private weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeNow()
        
    }
    
    func timeNow() {
        let dateTime = Date()
        let formatDate = DateFormatter()
        formatDate.dateFormat = "HH:mm:ss   dd-MM-yyyy"
        timeLabel.text = formatDate.string(from: dateTime)
        timeLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        timeLabel.backgroundColor = .clear
        view.addSubview(timeLabel)
    }
    
    func timeUpdate() {
        return timeNow()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        return timeNow()
    }
    
    
}
