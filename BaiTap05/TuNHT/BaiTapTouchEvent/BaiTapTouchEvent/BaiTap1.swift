//
//  BaiTap1.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 6/28/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap1: UIViewController {
    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            guard touch.view == ballImageView else { return }
            ballImageView.center = touch.location(in: self.view)
        }
    }
}
