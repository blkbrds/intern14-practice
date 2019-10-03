//
//  SliderItem.swift
//  CustomView
//
//  Created by MBA0051 on 10/3/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol SliderItemDelegate: class {
    func getValueChange(view: SliderItem, value: String)
}

class SliderItem: ParentView {

    @IBOutlet weak var degreeView: DegreeItem!
    @IBOutlet weak var sliderView: UISlider!
    weak var delegate: SliderItemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        degreeView.center.x = sliderView.thumbCenterX
        sliderView.value = 0.5
        degreeView.changeDegreeValue(value: sliderView.value)
        degreeView.center.y = sliderView.thumbCenterY - (sliderView.thumbSize.height) + (degreeView.frame.height / 2)
    }
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        degreeView.center.x = sliderView.thumbCenterX
        degreeView.changeDegreeValue(value: sender.value)
        delegate?.getValueChange(view: self, value: String(sender.value))
    }
}

extension UISlider {
    //this version will return the x coordinate in relation to the UISlider frame
    var thumbCenterX: CGFloat {
        return thumbRect(forBounds: frame, trackRect: trackRect(forBounds: bounds), value: value).midX
    }
    var thumbCenterY: CGFloat {
        return thumbRect(forBounds: frame, trackRect: trackRect(forBounds: bounds), value: value).midY
    }
    var thumbSize: CGSize {
        return thumbRect(forBounds: frame, trackRect: trackRect(forBounds: bounds), value: value).size
    }
}
