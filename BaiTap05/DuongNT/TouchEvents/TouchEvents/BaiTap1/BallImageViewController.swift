//
//  BallImageViewController.swift
//  TouchEvents
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class BallImageViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if ballImageView.frame.contains(touch.location(in: self.view)) {
                ballImageView.center = touch.location(in: self.view)
            }
        }
    }
}
