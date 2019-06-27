//
//  Bai1OAViewController.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/24/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai1OAViewController: UIViewController {
    struct Config {
        static let xFrameLabel = UIScreen.main.bounds.width / 2 - Config.timeWidth / 2
        static let yFrameLabel = UIScreen.main.bounds.height / 2 - Config.timeHeight / 2
        static let timeWidth: CGFloat = 200
        static let timeHeight: CGFloat = 20
    }
        
    @IBOutlet private weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameLabel = CGRect(x: Config.xFrameLabel, y: Config.yFrameLabel, width: Config.timeWidth, height: Config.timeHeight)
        configUI(frame: frameLabel)
    }
    
    func configUI(frame: CGRect) {
        timeLabel.frame = frame
        timeLabel.backgroundColor = .clear
        timeLabel.text = timeUpdate()
        timeLabel.textColor = .red
        timeLabel.textAlignment = .center
        view.addSubview(timeLabel)
    }
    
    func timeUpdate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss    dd-MM-yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        timeLabel.text = timeUpdate()        
    }
}
