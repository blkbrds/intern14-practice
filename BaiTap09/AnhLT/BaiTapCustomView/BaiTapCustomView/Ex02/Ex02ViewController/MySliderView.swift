//
//  MySliderView.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/23/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit 
protocol MySliderViewDelegate: class {
    func mySlider(_ mySlider: MySliderView, value: Int)
}

protocol MySliderViewDataSource: class {
    func getPercent(_ mySlider: MySliderView) -> Int
}

class MySliderView: UIView {
    weak var delegate : MySliderViewDelegate?
    weak var dataSource : MySliderViewDataSource?
    var value: CGFloat = 0
    @IBOutlet weak var emptyRectView: UIView!
    @IBOutlet weak var rectView: UIView!
    @IBOutlet weak var vuButtonImageView: UIImageView!
    
    @IBOutlet weak var valueView: UIView!
    
    @IBOutlet weak var valueBackGround: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        valueView.center.x = vuButtonImageView.center.x
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: rectView)
        if vuButtonImageView.frame.contains(location) {
            if location.x >= 0 && location.x <= rectView.frame.size.width {
                vuButtonImageView.center.x = location.x
                value = (rectView.frame.size.width - location.x) * 100 / rectView.frame.size.width
                emptyRectView.frame.size.width = location.x
                rectView.frame.contains(location)
                valueLabel.text = "\(Int(value))"
                delegate?.mySlider(self, value: Int(value))
                valueView.center.x = vuButtonImageView.center.x
             }
        }
    }
    
    func updateSlider() {
        guard let percent = dataSource?.getPercent(self) else { return }
        var temp = percent
        if temp > 100 { temp = 100}
        if temp < 0 { temp = 0 }
        vuButtonImageView.center.x = rectView.bounds.width - (CGFloat(temp) * rectView.bounds.width / 100 )
        emptyRectView.frame.size.width = vuButtonImageView.center.x
//        valueLabel.center.x = vuButtonImageView.center.x + 20
//        valueBackGround.center.x = valueLabel.center.x + 20
        valueView.center.x = vuButtonImageView.center.x
        valueLabel.text = "\(temp)"
    }
}

