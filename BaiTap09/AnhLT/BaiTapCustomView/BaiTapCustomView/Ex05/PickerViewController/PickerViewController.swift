//
//  Ex05ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/29/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet private weak var leftValueTextField: UITextField!
    @IBOutlet private weak var unitsPicker: UIPickerView!
    @IBOutlet private weak var convertButton: UIButton!
    @IBOutlet private weak var rightValueTextField: UITextField!
    var fromUnit = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unitsPicker.delegate = self
        self.unitsPicker.dataSource = self
        convertButton.layer.cornerRadius = 10
        leftValueTextField.delegate = self
        rightValueTextField.delegate = self
    }
    
    let pickerData: [String] = ["inch", "centimeter", "foot", "meter", "millimeter"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fromUnit = component
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == leftValueTextField {
            fromUnit = 0
        } else if textField == rightValueTextField {
            fromUnit = 1
        }
        return true
    }
    
    enum Unit: Int {
        case inch
        case centimeter
        case foot
        case meter
        case millimeter
        
        func convertTo(toValue: Unit, value: Double) -> Double {
            var constant = 1.0
            switch self {
            case .inch:
                switch toValue {
                case .centimeter:
                    constant = 2.54
                case .foot:
                    constant = 0.08333333
                case .meter:
                    constant = 0.0254
                case .millimeter:
                    constant = 25.4
                default: break
                }
                
            case .centimeter:
                switch toValue {
                case .meter:
                    constant = 0.01
                case .inch:
                    constant = 0.0393701
                case .foot:
                    constant = 0.0328084
                case .millimeter:
                     constant = 10
                default: break
                }
            
            case .foot:
                switch toValue {
                case .meter:
                    constant = 0.3048
                case .centimeter:
                    constant = 30.48
                case .inch:
                    constant = 12
                case .millimeter:
                    constant = 304.8
                default: break
                }
                
            case .meter:
                switch toValue {
                case .centimeter:
                    constant = 100
                case .foot:
                    constant = 3.28084
                case .inch:
                    constant = 39.37008
                case .millimeter:
                    constant = 1000
                default: break
                }
                
            case .millimeter:
                switch toValue {
                case .centimeter:
                    constant = 0.1
                case .foot:
                    constant = 0.00328084
                case .meter:
                    constant = 0.001
                case .inch:
                    constant = 0.03937008
                default: break
                }
            }
            return constant * value
        }
    }

    @IBAction func convertUnitButtonTouchUpInside(_ sender: Any) {
        if fromUnit == 0, let leftValue = leftValueTextField.text , let value = Double(leftValue) {
            convertLeftToRight(value: value)
        } else if fromUnit == 1, let rightValue = rightValueTextField.text , let value = Double(rightValue) {
            convertRightToLeft(value: value)
        } else if let leftValue = leftValueTextField.text , let value = Double(leftValue) {
            convertLeftToRight(value: value)
        } else if let rightValue = rightValueTextField.text , let value = Double(rightValue) {
            convertRightToLeft(value: value)
        }
    }
    
    func convertLeftToRight(value: Double) {
        let indexFromValue = unitsPicker.selectedRow(inComponent: 0)
        let indexToValue = unitsPicker.selectedRow(inComponent: 1)
        guard let fromValue = Unit(rawValue: indexFromValue), let toValue = Unit(rawValue: indexToValue) else { return }
        rightValueTextField.text = "\(fromValue.convertTo(toValue: toValue, value: value))"
    }

    func convertRightToLeft(value: Double) {
        let indexFromValue = unitsPicker.selectedRow(inComponent: 1)
        let indexToValue = unitsPicker.selectedRow(inComponent: 0)
        guard let fromValue = Unit(rawValue: indexFromValue), let toValue = Unit(rawValue: indexToValue) else { return }
        leftValueTextField.text = "\(fromValue.convertTo(toValue: toValue, value: value))"
    }
}


