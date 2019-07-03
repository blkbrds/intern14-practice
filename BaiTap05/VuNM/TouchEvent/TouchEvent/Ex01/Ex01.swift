//
//  Ex01.swift
//  TouchEvent
//
//  Created by PCI0007 on 6/28/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex01: UIViewController {

    @IBOutlet weak var ballUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustFrame()
    }
    
    var location = CGPoint(x: 0, y: 0)
    
    private func adjustFrame() {
        ballUIImageView.layer.cornerRadius = ballUIImageView.frame.height / 2
        ballUIImageView.layer.masksToBounds = false
        ballUIImageView.clipsToBounds = true
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            location = touch.location(in: view.self)
            if ballUIImageView.frame.contains(location) {
            ballUIImageView.center = location
            }
        }
    }
}
