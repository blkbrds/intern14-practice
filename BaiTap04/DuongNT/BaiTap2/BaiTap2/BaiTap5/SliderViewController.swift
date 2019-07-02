//
//  SliderViewController.swift
//  BaiTap2
//
//  Created by Nguyen Duong on 7/1/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        handleColorView()
    }

    private func handleColorView() {
        mainView.layer.cornerRadius = 40
        guard let red = sliderRed, let blue = sliderBlue, let green = sliderGreen else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        lblTitle.text = "Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
        lblTitle.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func colorChangeView(red: Float, green: Float, blue: Float) {
        mainView.backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        guard let red = sliderRed, let blue = sliderBlue, let green = sliderGreen else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        lblTitle.text = "Color (R: \(Int(red.value)), G: \(Int(green.value)), B: \(Int(blue.value)))"
    }
}
