//
//  BaiTap05ViewController.swift
//  BaiTapIBOutLetIBAction
//
//  Created by Nguyen Truong Lam Vien on 6/26/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap05ViewController: UIViewController {

    @IBOutlet private weak var detailColorLabel: UILabel!
    @IBOutlet private weak var showColorView: UIView!
    @IBOutlet private weak var redSliderValueChanged: UISlider!
    @IBOutlet private weak var greenSliderValueChanged: UISlider!
    @IBOutlet private weak var blueSliderValueChanged: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designView(red: 0, green: 0, blue: 0)
    }
    
    private func designView(red: CGFloat, green: CGFloat, blue: CGFloat) {
        showColorView.layer.cornerRadius = 10
        showColorView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        showColorView.layer.borderWidth = 0.2
        showColorView.backgroundColor = UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
        detailColorLabel.text = "Color (R:\(Int(red)), G:\(Int(green)), B:\(Int(blue)))"
    }
    
    @IBAction private func valueChanged(_ sender: UISlider) {
        guard let red = redSliderValueChanged?.value, let green = greenSliderValueChanged?.value, let blue = blueSliderValueChanged?.value else {
            return
        }
        designView(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
    }
}
