//
//  Ex02.swift
//  BaitapIBaction
//
//  Created by PCI0007 on 6/27/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex02: UIViewController {

    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var grapeButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var plus1AllButton: UIButton!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var grapenLabel: UILabel!
    @IBOutlet weak var appleLabel: UILabel!
    
    var bananaQuantity = 1
    var grapeQuantity = 1
    var appleQuantiy = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
    }
    
    private func print() {
        bananaLabel.text = "banana"
        grapenLabel.text = "grape"
        appleLabel.text = "apple"
        appleButton.layer.borderWidth = 2
        appleButton.layer.borderColor = UIColor.cyan.cgColor
        appleButton.layer.cornerRadius = 12
        grapeButton.layer.borderWidth = 2
        grapeButton.layer.borderColor = UIColor.cyan.cgColor
        grapeButton.layer.cornerRadius = 12
        bananaButton.layer.borderWidth = 2
        bananaButton.layer.cornerRadius = 12
        bananaButton.layer.borderColor = UIColor.cyan.cgColor
        plus1AllButton.layer.borderWidth = 2
        plus1AllButton.layer.cornerRadius = 12
        plus1AllButton.layer.borderColor = UIColor.cyan.cgColor
    }
    
    @IBAction func bananaTouchUpInside(_ sender: Any?) {
        bananaButton.setTitle("\(bananaQuantity)", for: .normal)
        bananaQuantity += 1
        bananaLabel.text = "banana"
    }
    
    @IBAction func grapeTouchUpInside(_ sender: Any?) {
        grapeButton.setTitle("\(grapeQuantity)", for: .normal)
        grapeQuantity += 1
        grapenLabel.text = "grape"
    }
    
    @IBAction func appleTouchUpInside(_ sender: Any?) {
        appleButton.setTitle("\(appleQuantiy)", for: .normal)
        appleQuantiy += 1
        appleLabel.text = "apple"
    }
    
    @IBAction func plus1AllTouchUpInside(_ sender: Any) {
        grapeTouchUpInside(nil)
        bananaTouchUpInside(nil)
        appleTouchUpInside(nil)
    }
}

