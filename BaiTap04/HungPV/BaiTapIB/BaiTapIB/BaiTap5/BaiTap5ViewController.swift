//
//  BaiTap5ViewController.swift
//  BaiTapIB
//
//  Created by PCI0010 on 7/31/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap5ViewController: UIViewController {
    
    // Mark: - Outlet
    @IBOutlet weak var colorText: UILabel!
    @IBOutlet weak var myColorLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayColors()
        view.backgroundColor = UIColor(red: 0xfd/255.0, green: 0xe8/255.0, blue: 0xd7/255.0, alpha: 1.0)
        
    }
    
    func displayColors() {
        myColorLabel.layer.cornerRadius = 40
        let red = CGFloat(redSlider.value)
        let blue = CGFloat(blueSlider.value)
        let green = CGFloat(greenSlider.value)
        let color = UIColor(displayP3Red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
        myColorLabel.backgroundColor = color
        let red1 = Int(red)
        let green1 = Int(green)
        let blue1 = Int(blue)
        colorText.text = "Color(R: \(red1), G: \(green1), B: \(blue1))"
    }
    
    // Mark: - Action
    @IBAction func redSlider(_ sender: UISlider) {
        let red = CGFloat(sender.value)
        sender.thumbTintColor = UIColor(displayP3Red: red, green: 0.0, blue: 0.0, alpha: 1.0)
        displayColors()
        
    }
    @IBAction func greenSlider(_ sender: UISlider) {
        let green = CGFloat(sender.value)
        sender.thumbTintColor = UIColor(displayP3Red: 0.0, green: green, blue: 0.0, alpha: 1.0)
        displayColors()
    }
    @IBAction func blueSlider(_ sender: UISlider) {
        let blue = CGFloat(sender.value)
        sender.thumbTintColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: blue, alpha: 1.0)
        displayColors()
    }
    
}
