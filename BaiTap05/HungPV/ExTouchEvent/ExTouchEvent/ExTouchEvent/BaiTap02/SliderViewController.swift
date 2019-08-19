//
//  SliderViewController.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/15/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    var percent: CGFloat = 0
    var num: Int = 0
    //Mark: - Outlet
    @IBOutlet weak var slideView: UIView!
    @IBOutlet weak var downView: UIView!
    @IBOutlet weak var percentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: slideView)
            if position.y >= 0 && position.y <= slideView.frame.height {
                self.percentButton.center.y = position.y
            } else if position.y <= 0 {
                self.percentButton.center.y = 0
            } else if position.y >= 200 {
                self.percentButton.center.y = 200
            }
            self.downView.frame = CGRect(x: 0, y: 200, width: 15, height: percentButton.center.y - 200)
            self.percent = 100 - (percentButton.center.y / CGFloat(200) * CGFloat(100))
            self.num = Int(percent)
            percentButton.setTitle("\(num)", for: .normal)
        }
    }
    
    //Mark: - Functions
    func configUI() {
        title = "Percent Slider"
        navigationController?.navigationBar.backgroundColor = .cyan
        percentButton.layer.cornerRadius = 10
        self.downView.frame = CGRect(x: 0, y: 200, width: 15, height: -100)
    }
    
    
    
}
