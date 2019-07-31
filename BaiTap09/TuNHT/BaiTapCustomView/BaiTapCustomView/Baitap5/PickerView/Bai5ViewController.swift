//
//  Bai5ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/29/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit


enum Unit {
    case inch
    case foot
    case kilometer
    case meter
    case centimeter
}

enum TextFieldChange {
    case left
    case right
}

class PickerViewViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var unitPicker: UIPickerView!
    @IBOutlet weak var convertButton: UIButton!
    
    let units: [String] = ["inch", "foot", "kilometer", "meter", "centimeter"]
    var firstNumberChange = TextFieldChange.left

    override func viewDidLoad() {
        super.viewDidLoad()

        firstNumberTextField.delegate = self
        secondNumberTextField.delegate = self
        
        unitPicker.delegate = self
        unitPicker.dataSource = self
    }
    
    private func convertTo(_ fromValue: String, _ toValue: String, _ value: Double) -> String {
        switch fromValue {
        case "inch":
            switch toValue {
            case "inch":
                return "\(value)"
            case "foot":
                return "\(value * 0.0833333)"
            case "kilometer":
                return "\(value * 2.54e-5)"
            case "meter":
                return "\(value * 0.0254)"
            case "centimeter":
                return "\(value * 2.54)"
            default:
                return ""
            }
        case "foot":
            switch toValue {
            case "inch":
                return "\(value * 12)"
            case "foot":
                return "\(value)"
            case "kilometer":
                return "\(value * 0.0003048)"
            case "meter":
                return "\(value * 0.3048)"
            case "centimeter":
                return "\(value * 30.48)"
            default:
                return ""
            }
        case "kilometer":
            switch toValue {
            case "inch":
                return "\(value * 39370.1)"
            case "foot":
                return "\(value * 3280.84)"
            case "kilometer":
                return "\(value)"
            case "meter":
                return "\(value * 1000)"
            case "centimeter":
                return "\(value * 100000)"
            default:
                return ""
            }
        case "meter":
            switch toValue {
            case "inch":
                return "\(value * 39.3701)"
            case "foot":
                return "\(value * 3.28084)"
            case "kilometer":
                return "\(value * 0.001)"
            case "meter":
                return "\(value)"
            case "centimeter":
                return "\(value * 100)"
            default:
                return ""
            }
        case "centimeter":
            switch toValue {
            case "inch":
                return "\(value * 0.393701)"
            case "foot":
                return "\(value * 0.0328084)"
            case "kilometer":
                return "\(value * 1e-5)"
            case "meter":
                return "\(value * 0.01)"
            case "centimeter":
                return "\(value)"
            default:
                return ""
            }
        default:
            return ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == firstNumberTextField {
            firstNumberChange = .left
        } else {
            firstNumberChange = .right
        }
        return true
    }

    @IBAction func convertButtonTouchUpInside(_ sender: UIButton) {
        let leftValue = units[unitPicker.selectedRow(inComponent: 0)]
        let rightValue = units[unitPicker.selectedRow(inComponent: 1)]
        switch firstNumberChange {
        case .left:
            if let text = firstNumberTextField.text, let value = Double(text) {
                secondNumberTextField.text = convertTo(leftValue, rightValue, value)
            }
        case .right:
            if let text = secondNumberTextField.text, let value = Double(text), !text.isEmpty {
                firstNumberTextField.text = convertTo(rightValue, leftValue, value)
            }
        }
    }
}

extension PickerViewViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let leftValue = units[unitPicker.selectedRow(inComponent: 0)]
//        let rightValue = units[unitPicker.selectedRow(inComponent: 1)]
//        if component == 0 {
//            if let text = secondNumberTextField.text, let value = Double(text) {
//                firstNumberTextField.text = convertTo(rightValue, leftValue, value)
//            }
//        } else {
//            if let text = firstNumberTextField.text, let value = Double(text) {
//                secondNumberTextField.text = convertTo(leftValue, rightValue, value)
//            }
//        }
    }
}

