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

    @IBOutlet weak var degreeView: DegreeItem?
    @IBOutlet weak var sliderView: UISlider?
    weak var delegate: SliderItemDelegate?
    private var currentValue : Float = 0.0
    private var mintrackColor: UIColor = .black
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        guard let degreeView = degreeView, let sliderView = sliderView else { return }
        setting(color: .black, start: 0.5)
        degreeView.center.x = self.frame.maxX / 2
        degreeView.changeDegreeValue(value: sliderView.value)
        degreeView.center.y = sliderView.thumbCenterY - (sliderView.thumbSize.height / 2) + (degreeView.frame.height / 2)
        currentValue = sliderView.value
    }
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        degreeView?.center.x = sliderView!.thumbCenterX
        degreeView?.changeDegreeValue(value: sender.value)
        delegate?.getValueChange(view: self, value: String(Int(sender.value * 100)))
    }
    
    func setting(color minColor: UIColor, start startValue: Float) {
        currentValue = startValue
        mintrackColor = minColor

        sliderView?.value = currentValue
        sliderView?.minimumTrackTintColor = mintrackColor
        degreeView?.center.x = sliderView!.thumbCenterX
        degreeView?.changeDegreeValue(value: currentValue)
    }
    
    func getCurrentPercent() -> String? {
        return String(Int(sliderView!.value * 100))
    }
}

extension UISlider {
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
