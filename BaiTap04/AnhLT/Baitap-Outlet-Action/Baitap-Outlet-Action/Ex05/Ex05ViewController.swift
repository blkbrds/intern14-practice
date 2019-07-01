//
//  Ex05ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by PCI0013 on 6/28/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex05ViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var valueChangeLabel: UILabel!
    @IBOutlet weak var colorChangeView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderAction(_ sender: Any) {
        valueChangeLabel.text = "red: \(redSlider.value), green: \(greenSlider.value), blue: \(blueSlider.value)"
        self.colorChangeView.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255, green: CGFloat(greenSlider.value) / 255, blue: CGFloat(blueSlider.value) / 255, alpha: 1)
        colorChangeView.layer.cornerRadius = 10
        
    }
}
