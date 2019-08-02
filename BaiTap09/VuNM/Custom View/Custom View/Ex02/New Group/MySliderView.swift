//
//  MySliderView.swift
//  Custom View
//
//  Created by PCI0007 on 7/24/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate: class {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action)
}

enum TypeView {
    case view1
    case view2
    case view3
}

class MySliderView: UIView {
    
    enum Action {
        case changePercent(result: Int, type: TypeView)
    }
    
    @IBOutlet weak var belowRect: UIView!
    @IBOutlet weak var UperRect: UIView!
    @IBOutlet weak var sliderButton: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueImage: UIImageView!
    
    weak var delegate: MySliderViewDelegate?
    var position: CGFloat = 50
    var type: TypeView = .view1

    override func awakeFromNib() {
        super.awakeFromNib()
        belowRect.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        sliderButton.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        sliderButton.clipsToBounds = true
        sliderButton.layer.cornerRadius = sliderButton.bounds.width * 0.5
        sliderButton.isUserInteractionEnabled = true
        UperRect.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        valueLabel.text = "50%"
    }
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        if touch.view == sliderButton {
            let touchPoint = touch.location(in: belowRect)
            if touchPoint.x >= 0 && touchPoint.x <= belowRect.frame.size.width {
                position = touchPoint.x
                sliderButton.center.x = position
                valueLabel.center.x = position + 42
                valueImage.center.x = position + 22
                let temp = Int((belowRect.frame.size.width - position ) * 100 / (belowRect.frame.size.width))
                valueLabel.text = "\(temp)%"
                UperRect.frame.size.width = sliderButton.center.x
                delegate?.view(self, needPerformAction: .changePercent(result: temp, type: type))
                print(position)
            }
        }
    }
    
    func changePosition(_ value: Int) {
        position = belowRect.frame.size.width - (CGFloat(value) * belowRect.frame.size.width / 100)
        sliderButton.center.x = position
        valueLabel.center.x = position + 42
        valueImage.center.x = position + 22
        valueLabel.text = "\(value)%"
        UperRect.frame.size.width = sliderButton.center.x
    }
}
