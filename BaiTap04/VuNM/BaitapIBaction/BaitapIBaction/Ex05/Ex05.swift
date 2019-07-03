//
//  Ex05.swift
//  BaitapIBaction
//
//  Created by PCI0007 on 6/28/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex05: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorBoard: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelForSlider()
    }
    
    @IBAction func adjustColorValueChanged(_ sender: Any?) {
        colorBoard.backgroundColor = UIColor(red: CGFloat(redSlider.value) / 255, green: CGFloat(greenSlider.value) / 255, blue: CGFloat(blueSlider.value) / 255, alpha: 1)
        setLabelForSlider()
    }
    
    private func setLabelForSlider() {
        redLabel.text = "Red  \((redSlider.value) / 255 * 100)"
        greenLabel.text = "Green  \((greenSlider.value) / 255 * 100)"
        blueLabel.text = "Blue  \((blueSlider.value) / 255 * 100)"
    }
}
