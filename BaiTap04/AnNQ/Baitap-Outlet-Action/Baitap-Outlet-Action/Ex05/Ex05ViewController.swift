//
//  Ex05ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by MBA0217 on 8/21/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit


struct BackGroundColor {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

class Ex05ViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var backGroundLabel: UILabel!
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSilder: UISlider!
    
    var backGroundColor = BackGroundColor(red: 0, green: 0, blue: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTemplateView()
        
    }
    
    func updateTemplateView() {
        headerLabel.text = "Color(R: \(backGroundColor.red), G: \(backGroundColor.green), B: \(backGroundColor.blue))"
        backGroundLabel.layer.masksToBounds = true
        backGroundLabel.layer.borderWidth = 1
        backGroundLabel.layer.cornerRadius = 50

        backGroundLabel.backgroundColor = UIColor(red: CGFloat(backGroundColor.red), green: CGFloat(backGroundColor.green), blue: CGFloat(backGroundColor.blue), alpha: 1)
    }
    
    @IBAction func colorSliderValueChange(_ sender: UISlider) {
        let value = CGFloat(sender.value)

        switch sender.tag {
        case 0:
            backGroundColor.red = value
        case 1:
            backGroundColor.green = value
        default:
            backGroundColor.blue = value
        }
        headerLabel.text = "Color(R: \(Int(backGroundColor.red)), G: \(Int(backGroundColor.green)), B: \(Int(backGroundColor.blue))"
        
        backGroundLabel.backgroundColor = UIColor(red: backGroundColor.red / 255, green: backGroundColor.green / 255, blue: backGroundColor.blue / 255, alpha: 1)
         print(backGroundColor.red, backGroundColor.green, backGroundColor.blue)
    }
    

}
