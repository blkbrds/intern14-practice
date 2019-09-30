//
//  SlidersView.swift
//  CustomView
//
//  Created by MBA0217 on 9/26/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit


protocol SlidersViewDelegate : class {
    func computePercentSlider(result: Int, index: Int)
}

class SlidersView: UIView {
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var temperatureSliderView: UISlider!
    @IBOutlet weak var temperatureImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var humiditySliderView: UISlider!
    @IBOutlet weak var humidityImageView: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var windPowerSliderView: UISlider!
    @IBOutlet weak var windPowerImageView: UIImageView!
    @IBOutlet weak var windPowerLabel: UILabel!
    
    weak var delegate: SlidersViewDelegate?
    private var percentLabel: UILabel?
    private var percentImageView: UIImageView?
    private var sliderView: UISlider?
    
    
    @IBAction func changeValueSlider(_ sender: UISlider) {
        let percentNumber = Int(ceil(100 * sender.value))
        switch sender.tag {
        case temperatureLabel.tag:
            percentLabel = temperatureLabel
            percentImageView = temperatureImageView
        case humidityLabel.tag:
            percentLabel = humidityLabel
            percentImageView = humidityImageView
        default:
            percentLabel = windPowerLabel
            percentImageView = windPowerImageView
        }
        
        percentLabel!.text = "\(percentNumber)%"
        if let delegate = self.delegate, let percentLabel = self.percentLabel, let percentImageView = self.percentImageView {
            delegate.computePercentSlider(result: percentNumber, index: sender.tag)
            
            let x = wrapperView.bounds.width * CGFloat(percentNumber) / 100
            percentLabel.frame = CGRect(x: x - 15, y: percentLabel.frame.origin.y, width: percentLabel.bounds.width, height: percentLabel.bounds.height)
            percentImageView.frame = CGRect(x: x - 50, y: percentImageView.frame.origin.y, width: percentImageView.bounds.width, height: percentImageView.bounds.height)
        } else {
            print("delegate is not exists")
        }
    }
    
    func changeSliderView(value: Float, index: Int) {
        let percentNumber = Int(value)
        switch index {
        case temperatureLabel.tag:
            percentLabel = temperatureLabel
            percentImageView = temperatureImageView
            sliderView = temperatureSliderView
        case humidityLabel.tag:
            percentLabel = humidityLabel
            percentImageView = humidityImageView
            sliderView = humiditySliderView
        default:
            percentLabel = windPowerLabel
            percentImageView = windPowerImageView
            sliderView = windPowerSliderView
        }
        
        percentLabel!.text = "\(percentNumber)%"
            
        let x = wrapperView.bounds.width * CGFloat(percentNumber) / 100
        if let percentLabel = self.percentLabel, let percentImageView = self.percentImageView, let sliderView = self.sliderView {
            percentLabel.frame = CGRect(x: x - 15, y: percentLabel.frame.origin.y, width: percentLabel.bounds.width, height: percentLabel.bounds.height)
            percentImageView.frame = CGRect(x: x - 50, y: percentImageView.frame.origin.y, width: percentImageView.bounds.width, height: percentImageView.bounds.height)
            sliderView.value = value / 100
        }
    }
}
