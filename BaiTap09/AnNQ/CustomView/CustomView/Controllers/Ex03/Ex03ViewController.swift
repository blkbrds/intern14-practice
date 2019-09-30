//
//  Ex03ViewController.swift
//  CustomView
//
//  Created by MBA0217 on 9/26/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var humidityTextField: UITextField!
    @IBOutlet weak var windPowerTextField: UITextField!

    let slidersView = Bundle.main.loadNibNamed("SlidersView", owner: self, options: nil)?[0] as? SlidersView
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI () {
        configInputUIView(textField: temperatureTextField)
        configInputUIView(textField: humidityTextField)
        configInputUIView(textField: windPowerTextField)
        
        sliderView.addSubview(slidersView!)
        slidersView?.delegate = self
    }
    
    private func configInputUIView(textField: UITextField) {
        textField.delegate = self
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.text = "50"
    }
    
    @IBAction func changeTextFieldValue(_ sender: UITextField) {
        if var percent = Float(sender.text!) {
            if percent > 100 {
                percent = 100
            }
            UIView.animate(
                withDuration: 1.0,
                delay: 0.0,
                options: .curveEaseIn,
                animations: {
                    self.slidersView?.changeSliderView(value: percent, index: sender.tag)
                },
                completion: { _ in
                }
            )
        }
    }
}

extension Ex03ViewController: UITextFieldDelegate, SlidersViewDelegate {
    func computePercentSlider(result: Int, index: Int) {
        switch index {
        case temperatureTextField.tag:
            temperatureTextField.text = "\(result)"
        case humidityTextField.tag:
            humidityTextField.text = "\(result)"
        default:
            windPowerTextField.text = "\(result)"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}
