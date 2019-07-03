//
//  Ex02ViewController.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/1/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {
        let containerView = UIView(frame: CGRect(x: 145, y: 100, width: 50, height: 300))
        let button = UIButton()
        let rectView = UIView()
        var emptyRect = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 300))

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame =  CGRect(x: 145, y: 100, width: 50, height: 300)
        view.addSubview(sliderView(frame, 40))
    }

    func sliderView(_ frame: CGRect,_ number: CGFloat) -> UIView {
//        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .white
    
        rectView.frame = CGRect(x: 10, y: 0, width: 30, height: 300)
        rectView.layer.borderWidth = 1
        rectView.layer.borderColor = UIColor(red: 255 / 255, green: 159 / 255, blue: 100 / 255, alpha: 1).cgColor
        rectView.layer.backgroundColor = UIColor(red: 100 / 255, green: 150 / 255, blue: 255 / 255, alpha: 1).cgColor
        containerView.addSubview(rectView)
        
        let located = number * rectView.bounds.height / 100
        
        button.frame = CGRect(x: 35, y: located, width: 50, height: 50)
        button.backgroundColor = .orange
        button.center = CGPoint(x: containerView.bounds.width * 0.5 , y:  rectView.bounds.height - located)
        button.setTitle("\(Int(number))%", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = button.bounds.width * 0.5
        button.layer.borderColor = UIColor(red: 60 / 255, green: 200 / 255, blue: 100 / 255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.isUserInteractionEnabled = false
        containerView.addSubview(button)
        
        emptyRect = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: rectView.bounds.height - located))
        emptyRect.layer.borderWidth = 0
        emptyRect.backgroundColor = .white
        rectView.addSubview(emptyRect)
        
        return containerView
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: containerView)
        if button.frame.contains(location) {
            if location.y >= 0 && location.y <= containerView.frame.size.height {
                button.center.y = location.y
                let value = (containerView.frame.size.height - location.y) * 100 / containerView.frame.size.height
                button.setTitle("\(Int(value))%", for: .normal)
                emptyRect.frame.size.height = location.y
                containerView.frame.contains(location)
            }
        }
    }
}



