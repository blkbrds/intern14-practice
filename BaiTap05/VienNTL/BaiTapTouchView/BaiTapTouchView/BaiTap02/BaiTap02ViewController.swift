//
//  BaiTap02ViewController.swift
//  BaiTapTouchView
//
//  Created by Nguyen Truong Lam Vien on 6/28/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap02ViewController: UIViewController {
    private let containerView = UIView(frame: CGRect(x: UIScreen.main.bounds.width * 0.475, y: UIScreen.main.bounds.height * 0.25, width: 30, height: 300))
    private let columnView = UIView()
    var whiteView = UIView()
    private let button = UIButton()
    private var valueChange: CGFloat = 60
    private var located: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(sliderView(valueChange))
    }
    
    private func sliderView(_ number: CGFloat) -> UIView {
        containerView.backgroundColor = .black
        
        located = containerView.bounds.height * number / 100
        
        columnView.frame = CGRect(x: 0, y: 0, width: 30, height: containerView.bounds.height)
        columnView.backgroundColor = UIColor(red: 235 / 255.0, green: 77 / 255.0, blue: 75 / 255.0, alpha: 1)
        columnView.layer.borderWidth = 1
        columnView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        containerView.addSubview(columnView)
        
        whiteView.frame = CGRect(x: 0, y: 0, width: 30, height: columnView.bounds.height - located)
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        whiteView.backgroundColor = .white
        containerView.addSubview(whiteView)
        
        button.frame = CGRect(x: containerView.bounds.origin.x - 10, y: containerView.bounds.height - located - 10, width: 50, height: 50)
        button.backgroundColor = .orange
        button.setTitle("\(Int(number))", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = button.bounds.width * 0.5
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.isUserInteractionEnabled = false
        containerView.addSubview(button)
        return containerView
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let location = touch.location(in: containerView)
            if button.frame.contains(location) {
                if location.y >= columnView.bounds.minY  && location.y <= columnView.bounds.maxY {
                    button.center.y = location.y
                    valueChange = button.center.y
                    button.setTitle("\(Int((100 - (valueChange / containerView.bounds.height * 100))))", for: .normal)
                    whiteView.frame = CGRect(x: 0, y: 0, width: 30, height: valueChange)
                }
            }
        }
    }
}
