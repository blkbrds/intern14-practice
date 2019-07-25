//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/23/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit


protocol MySliderViewDelegate: class {
    func updateValue()
}

protocol MySliderViewDataSource: class {
    func getValue(_ view: MySliderView) -> Int
}

class MySliderView: UIView {
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var tintSliderView: UIView!
    @IBOutlet weak var buttonImageView: UIImageView!
    @IBOutlet weak var thumbnailLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    weak var delegate: MySliderViewDelegate?
    weak var dataSource: MySliderViewDataSource?
    public var tags: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tintSliderView.layer.cornerRadius = 10
        sliderView.layer.cornerRadius = 10
        updateCurrentValue()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: sliderView)
        if location.x >= 0 && location.x <= sliderView.bounds.width {
            buttonImageView.center.x = location.x
        } else if location.x > sliderView.bounds.width {
            buttonImageView.center.x = sliderView.bounds.width
        } else {
            buttonImageView.center.x = 0
        }
        thumbnailLabel.center.x = buttonImageView.center.x
        thumbnailImageView.center.x = thumbnailLabel.center.x
        tintSliderView.frame.size.width = buttonImageView.center.x
        updateCurrentValue()
        delegate?.updateValue()
    }
    
    func updateSlider() {
        guard let value = dataSource?.getValue(self) else { return }
        var temp = value
        if temp > 100 { temp = 100}
        if temp < 0 { temp = 0 }
        buttonImageView.center.x = CGFloat(temp) * sliderView.bounds.width / 100
        tintSliderView.frame.size.width = buttonImageView.center.x
        thumbnailLabel.center.x = buttonImageView.center.x
        thumbnailImageView.center.x = thumbnailLabel.center.x
        thumbnailLabel.text = "\(temp)%"
    }
    
    func updateCurrentValue() {
        let currentX = buttonImageView.center.x
        let located = currentX * 100 / sliderView.bounds.width
        thumbnailLabel.text = "\(Int(located))%"
    }
}
