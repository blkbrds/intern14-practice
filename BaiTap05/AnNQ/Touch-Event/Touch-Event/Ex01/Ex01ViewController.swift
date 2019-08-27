//
//  Ex01ViewController.swift
//  Touch-Event
//
//  Created by MBA0217 on 8/22/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            imageView.center = position
        }
    }

}
