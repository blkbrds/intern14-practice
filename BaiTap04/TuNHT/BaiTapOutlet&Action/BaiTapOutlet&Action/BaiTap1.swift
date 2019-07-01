//
//  BaiTap1.swift
//  BaiTapOutlet&Action
//
//  Created by PCI0001 on 6/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap1: UIViewController {
    let x = UIScreen.main.bounds.width / 2 - Config.timeWidth / 2
    let y = UIScreen.main.bounds.height / 2 - Config.timeHeight / 2
    
    struct Config {
        static let timeWidth: CGFloat = 200
        static let timeHeight: CGFloat = 20
    }
    
    var timeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameLabel = CGRect(x: x, y: y, width: Config.timeWidth, height: Config.timeHeight)
        configUI(frame: frameLabel)
    }
    
    func configUI(frame: CGRect) {
        timeLabel.frame = frame
        timeLabel.backgroundColor = .white
        timeLabel.text = updateTime()
        timeLabel.textColor = .red
        timeLabel.textAlignment = .center
        view.addSubview(timeLabel)
    }
    
    func updateTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss dd-MM-yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches Began")
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            print("\(position.x), \(position.y)")
        }
        timeLabel.text = updateTime()
    }
}
