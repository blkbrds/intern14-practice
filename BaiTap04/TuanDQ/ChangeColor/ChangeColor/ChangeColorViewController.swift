//
//  ChangeColorViewController.swift
//  ChangeColor
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ChangeColorViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 100 / 255
        greenSlider.value = 100 / 255
        blueSlider.value = 100 / 255
        
        valueChanged(self)
        // Do any additional setup after loading the view.
    }

    @IBAction func valueChanged(_ sender: Any) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
}
