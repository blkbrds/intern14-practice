//
//  BallViewController.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/15/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BallViewController: UIViewController {
    
    @IBOutlet private weak var ballView: UIImageView!
    
    let myBall = UIImage(imageLiteralResourceName: "Ballicon.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ball-Ball-Ball"
        navigationController?.navigationBar.backgroundColor = .cyan
        ballView.image = myBall
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            self.ballView.center = position
        }
    }
    
    
    
}
