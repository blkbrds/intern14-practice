//
//  Bai5OAViewController.swift
//  IBOutletAndIBAction
//
//  Created by PCI0008 on 6/26/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai5OAViewController: UIViewController {

    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var colorLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 40
        colorView.layer.borderWidth = 2
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.layer.masksToBounds = true
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        colorLabel.text = "Color (R: \(Int(red.value)) G: \(Int(green.value)) B: \(Int(blue.value)))"
    }
    
    func colorChangeView(red: Float, green: Float, blue: Float) {
        colorView.backgroundColor = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
    }
    
    @IBAction private func redValueChanged(_ sender: UISlider) {
        guard let red = redSlider, let blue = blueSlider, let green = greenSlider else { return }
        colorChangeView(red: red.value, green: green.value, blue: blue.value)
        colorLabel.text = "Color (R: \(Int(red.value)) G: \(Int(green.value)) B: \(Int(blue.value)))"
    }
}
