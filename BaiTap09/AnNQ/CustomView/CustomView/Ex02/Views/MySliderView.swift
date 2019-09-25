//
//  MySliderView.swift
//  CustomView
//
//  Created by MBA0217 on 9/24/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol MySliderViewDelegate : class {
    func computePercentSlider(result: Int)
}

class MySliderView: UIView {

    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var percentImageView: UIImageView!
    @IBOutlet weak var wrapperView: UIView!
    weak var delegate: MySliderViewDelegate?
    
    @IBAction func changeValueSlider(_ sender: UISlider) {
        let percentNumber = Int(ceil(100 * sender.value))
        percentLabel.text = "\(percentNumber)%"
        if let delegate = self.delegate {
            delegate.computePercentSlider(result: percentNumber)
            
            let x = wrapperView.bounds.width * CGFloat(percentNumber) / 100
            percentLabel.frame = CGRect(x: x, y: percentLabel.frame.origin.y, width: percentLabel.bounds.width, height: percentLabel.bounds.height)
            percentImageView.frame = CGRect(x: x - 30, y: percentImageView.frame.origin.y, width: percentImageView.bounds.width, height: percentImageView.bounds.height)
        } else {
            print("delegate is not exists")
        }
    }
    
    func changeSliderView(value: Float) {
        let percentNumber = Int(value)
        percentLabel.text = "\(percentNumber)%"
        let x = wrapperView.bounds.width * CGFloat(percentNumber) / 100
        percentLabel.frame = CGRect(x: x, y: percentLabel.frame.origin.y, width: percentLabel.bounds.width, height: percentLabel.bounds.height)
        percentImageView.frame = CGRect(x: x - 30, y: percentImageView.frame.origin.y, width: percentImageView.bounds.width, height: percentImageView.bounds.height)
        sliderView.value = value / 100
    }
}
