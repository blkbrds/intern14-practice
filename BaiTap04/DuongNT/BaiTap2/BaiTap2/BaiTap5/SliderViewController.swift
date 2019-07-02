//
//  SliderViewController.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        handleColorView()
    }

    private func handleColorView() {
        mainView.layer.cornerRadius = 40
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        titleLabel.text = "Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func colorChangeView(red: Float, green: Float, blue: Float) {
        mainView.backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        titleLabel.text = "Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
    }
}
