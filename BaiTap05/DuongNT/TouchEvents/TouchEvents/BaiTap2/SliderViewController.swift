//
//  SliderViewController.swift
//  TouchEvents
//
//  Created by Nguyen Duong on 7/2/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    private var containerView = UIView()
    private var sliderCircleLabel = UILabel()
    private var backgroundSlideView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let x =  CGRect(x: 125, y: 150, width: 100, height: 500)
        view.addSubview(sliderView(x, 70))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: containerView)
        if location.y > 0.0 && location.y < containerView.frame.size.height {
            sliderCircleLabel.center.y = location.y
            let value = (containerView.frame.size.height - location.y) * 100 / containerView.frame.size.height
            sliderCircleLabel.text = "\(Int(value))"
            backgroundSlideView.frame.size.height = location.y
            
        }
    }
    
    private func sliderView(_ frame: CGRect, _ number: CGFloat) -> UIView {
        containerView = UIView(frame: frame)
        
        let columnView = UIView(frame: CGRect(x: 25, y: 25, width: 100, height: 500))
        columnView.layer.borderWidth = 1
        columnView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        columnView.backgroundColor = .blue
        containerView.addSubview(columnView)
        
        let located = number * columnView.bounds.height / 100
        
        backgroundSlideView = UILabel(frame: CGRect(x: 25, y: 25, width: 100, height: columnView.bounds.height - located))
        backgroundSlideView.layer.borderWidth = 1
        backgroundSlideView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        backgroundSlideView.backgroundColor = .white
        containerView.addSubview(backgroundSlideView)
        
        sliderCircleLabel = UILabel(frame: CGRect(x: 0, y: columnView.bounds.height - located - 25, width: 150, height: 150))
        sliderCircleLabel.backgroundColor = .orange
        sliderCircleLabel.text = "\(Int(number))"
        sliderCircleLabel.textAlignment = .center
        sliderCircleLabel.textColor = .white
        sliderCircleLabel.layer.cornerRadius = sliderCircleLabel.bounds.width / 2
        sliderCircleLabel.clipsToBounds = true
        sliderCircleLabel.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        sliderCircleLabel.layer.borderWidth = 1
        containerView.addSubview(sliderCircleLabel)
        return containerView
    }
    
}
