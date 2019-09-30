//
//  SliderViewController.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var remainValue: UIView!
    @IBOutlet weak var totalValue: UIView!
    @IBOutlet weak var slideButtonView: UIView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var sliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        if (touch.view == slideButtonView) {
            if ((touch.location(in: sliderView).y < 0)
                || (touch.location(in: sliderView).y > sliderView.frame.size.height)){
                return
            }
            slideButtonView.center.y = touch.location(in: sliderView).y
            remainValue.frame.size.height = slideButtonView.center.y
            
            sliderValue.text = String(Int(remainValue.frame.size.height) * 100 / Int(totalValue.frame.size.height))
        }
    }

}
