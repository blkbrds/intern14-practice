//
//  MySliderView.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

//MARK: Delegate
protocol MySliderViewDelegate: class {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action)
}

//MARK: Data Source
protocol MySliderViewDataSource: class {
    func getPercent(_ view: MySliderView) -> Int
}

final class MySliderView: UIView {
    enum Action {
        case getPercent(result: Int)
    }
    
    @IBOutlet private weak var percentView: UIView!
    @IBOutlet private weak var percentLabel: UILabel!
    @IBOutlet private weak var bigView: UIView!
    @IBOutlet private weak var blueView: UIView!    
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var temp = 50
    weak var delegate: MySliderViewDelegate?
    weak var dataSource: MySliderViewDataSource?
    
    //MARK: load Design
    override func awakeFromNib() {
        orangeView.layer.cornerRadius = 8
        blueView.layer.cornerRadius = 8
        percentLabel.text = "\(temp)%"
    }
    
    func reloadDesign() {
        guard let number = dataSource?.getPercent(self) else { return }
        temp = number
        if temp > 100 { temp = 100 }
        if temp < 0 { temp = 0 }
        orangeView.frame.size.width = CGFloat(temp) * blueView.frame.size.width / 100
        imageView.center.x = orangeView.frame.size.width
        percentView.center.x = imageView.center.x + 20
        percentLabel.text = "\(temp)%"
    }
    
    //MARK: Move Slider
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: bigView)
        if imageView.frame.contains(touchPoint) {
            if touchPoint.x >= 0 && touchPoint.x <= blueView.frame.size.width {
                imageView.center.x = touchPoint.x
                temp = Int(orangeView.frame.size.width * 100 / blueView.frame.size.width)
                percentLabel.text = "\(temp)%"
                orangeView.frame.size.width = imageView.center.x
                percentView.center.x = imageView.center.x + 20
                delegate?.view(self, needPerformAction: .getPercent(result: temp))
            }
        }
    }
}
