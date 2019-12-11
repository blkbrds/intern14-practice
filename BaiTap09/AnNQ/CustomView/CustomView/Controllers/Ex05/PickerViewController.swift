//
//  PickerViewController.swift
//  CustomView
//
//  Created by MBA0217 on 9/30/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var wrapperPickerView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    var inputValue: Int? = 0
    
    var pickerView = ConvertPickerView.loadNibNamed()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
              
    func configUI() {
        inputTextField.delegate = self
        pickerView.delegate = self
        wrapperPickerView.addSubview(pickerView)
        outputTextField.isUserInteractionEnabled = false
    }
    
    @IBAction func editChangeTextField(_ sender: UITextField) {
        inputValue = Int(sender.text!)
        outputTextField.text = sender.text

    }
}

extension PickerViewController: UITextFieldDelegate, ConvertPickerViewDelegate {
    func convertData(convertArray: [String]) {
        let value = self.inputValue!
        if value > 0 {
            if convertArray == ["decimeter", "centimeter"] || convertArray == ["meter", "decimeter"] {
                outputTextField.text = "\(10 * value)"
            } else if convertArray == ["centimeter", "decimeter"] || convertArray == ["decimeter", "meter"] {
                outputTextField.text = "\(Double(value / 10))"
            } else if convertArray == ["centimeter", "meter"] {
                outputTextField.text = "\(Double(value / 100))"
            } else if convertArray == ["meter", "centimeter"] {
                outputTextField.text = "\(value * 100)"
            } else{
                outputTextField.text = "\(Int(value))"
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}
