//
//  Ex01ViewController.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/1/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: view)
            if ballImageView.frame.contains(location) {
                ballImageView.center = location
            } else {
                
            }
        }
    }
}
