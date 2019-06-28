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
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        titleLabel.textColor = .black
        
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        backgroundView.backgroundColor = UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
        titleLabel.text = "Color(R: \(Int(red)), G: \(Int(green)), B: \(Int(blue)))"
    }
    
    @IBAction private func redButtonValueChanged(_ sender: UISlider) {
        guard let red = redSlider?.value, let green = greenSlider?.value, let blue = blueSlider?.value else {
            return
        }
        designView(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
    }
}
