//
//  MySliderView.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/20/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func valueChange(_ view: MySliderView, needPerformAction action: MySliderView.Action)
}

protocol MySliderViewDatasource: class {
    func getValue(_ view: MySliderView) -> Int
}

class MySliderView: UIView {
    
    var index = 0
    var num = 0
    var percent: CGFloat =  0.0
    weak var delegate: MySliderViewDelegate?
    weak var dataSource: MySliderViewDatasource?
    
    enum Action {
        case getPercent(percent: Int)
    }
    
    @IBOutlet weak var mainSlider: UIView!
    @IBOutlet weak var subSlider: UIView!
    @IBOutlet weak var ballView: UIImageView!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var topicView: UIImageView!
    @IBOutlet weak var valueSlideView: UILabel!
    
    func updateView() {
        guard let newNum = dataSource?.getValue(self) else { return }
        var num = newNum
        if num > 100 { num = 100 }
        if num < 0 { num = 0 }
        self.valueSlideView.text = String(num)
        self.subSlider.frame.size.width = CGFloat(num) * mainSlider.frame.size.width / 100
        self.ballView.center.x = subSlider.frame.size.width
        self.commentView.center.x = 67 + ballView.center.x
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: mainSlider)
            if position.x >= 0 && position.x <= mainSlider.frame.width {
                self.ballView.center.x = position.x
                self.commentView.center.x = ballView.center.x + 67
            } else if position.x <= 0 {
                self.ballView.center.x = 0
                self.commentView.center.x = 67
            } else if position.x >= 100 {
                self.ballView.center.x = mainSlider.frame.width
                self.commentView.center.x = mainSlider.frame.width + 67
            }
            self.subSlider.frame = CGRect(x: 0, y: 0, width: ballView.center.x, height: 20)
            self.percent = subSlider.center.x / CGFloat(100) * CGFloat(100)
            self.num = Int(percent)
            valueSlideView.text = "\(num)"
            delegate?.valueChange(self, needPerformAction: .getPercent(percent: num))
        }
    }
}
