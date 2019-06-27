//
//  Bai1TouchEventViewController.swift
//  TouchEvent
//
//  Created by PCI0008 on 6/27/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai1ViewController: UIViewController {
    @IBOutlet private weak var ballImageView: UIImageView!
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
