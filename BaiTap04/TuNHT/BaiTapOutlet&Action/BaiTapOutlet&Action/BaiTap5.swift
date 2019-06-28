//
//  BaiTap5.swift
//  BaiTapOutlet&Action
//
//  Created by PCI0001 on 6/27/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap5: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Color(R: , G: , B: )"
        titleLabel.textColor = .black

    }
    
    @IBAction func redButtonValueChanged(_ sender: UISlider) {
        red = CGFloat(sender.value)
        backgroundLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func greenButtonValueChanged(_ sender: UISlider) {
        green = CGFloat(sender.value)
        backgroundLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    @IBAction func blueButtonValueChanged(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        backgroundLabel.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
