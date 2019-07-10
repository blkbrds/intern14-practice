//
//  BaiTap01ViewController.swift
//  BaiTapTouchView
//
//  Created by Nguyen Truong Lam Vien on 6/27/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap01ViewController: UIViewController {

    @IBOutlet weak var pokemonBallImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self.view)
            pokemonBallImageView.center = location
        }
    }
}
