//
//  BaiTap2.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 6/28/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap2: UIViewController {
    private var thumbButton = UIButton()
    private var tintSliderView = UIView()
    private var sliderView = UIView()
    let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlider()
    }
    
    func makeSlider() {
        containerView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 400))
        containerView.center = view.center

        tintSliderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 400)))
        tintSliderView.center.x = containerView.center.x
        tintSliderView.layer.borderWidth = 1
        tintSliderView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        tintSliderView.backgroundColor = .blue
        containerView.addSubview(tintSliderView)

        sliderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 400)))
        sliderView.center.x = containerView.center.x
        sliderView.layer.borderWidth = 1
        sliderView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        sliderView.backgroundColor = .white
        containerView.addSubview(sliderView)

        thumbButton = UIButton(frame: CGRect(origin: CGPoint(x: containerView.center.x, y: 370), size: CGSize(width: 60, height: 60)))
        thumbButton.center.x = containerView.center.x
        thumbButton.backgroundColor = .orange
        thumbButton.setTitle("0%", for: .normal)
        thumbButton.setTitleColor(.black, for: .normal)
        thumbButton.layer.cornerRadius = thumbButton.bounds.width * 0.5
        thumbButton.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        thumbButton.layer.borderWidth = 1
        thumbButton.isUserInteractionEnabled  = false
        containerView.addSubview(thumbButton)

        view.addSubview(containerView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: containerView)
        if location.y >= 0 && location.y <= 400 {
            thumbButton.center.y = location.y
        } else if location.y > 400 {
            thumbButton.center.y = 400
        } else {
            thumbButton.center.y = 0
        }
        sliderView.frame.size.height = thumbButton.center.y
        updateCurrentValue()
    }
    
    func updateCurrentValue() {
        let currentY = containerView.bounds.height - thumbButton.center.y
        let located = currentY * 100 / containerView.bounds.height
        thumbButton.setTitle("\(Int(located))%", for: .normal)
    }
}
