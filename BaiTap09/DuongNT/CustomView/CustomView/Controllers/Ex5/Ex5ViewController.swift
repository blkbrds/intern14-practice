//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {

    // MARK: - properties

    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var leftValueTextField: UITextField!
    @IBOutlet weak var rightValueTextField: UITextField!

    // MARK: - properties

    var exercise: Exercise?
    private var pickerData = ["Inch", "Centimeter", "Foot", "Meter"]
    private var leftTextFieldInput: Bool = false
    private var rightTextFieldInput: Bool = false

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - config

    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        leftValueTextField.delegate = self
        rightValueTextField.delegate = self
        leftValueTextField.addTarget(self, action: #selector(leftTextFieldChange), for: .touchDown)
        rightValueTextField.addTarget(self, action: #selector(rightTextFieldChange), for: .touchDown)
        myPickerView.delegate = self
        myPickerView.delegate?.pickerView?(myPickerView, didSelectRow: 0, inComponent: 0)
    }

    @objc private func leftTextFieldChange() {
        leftTextFieldInput = true
        rightTextFieldInput  = false
    }

    @objc private func rightTextFieldChange() {
        leftTextFieldInput = false
        rightTextFieldInput  = true
    }

    override func setupData() {
    }

    // MARK: - custom func

    private func convertTo(_ fromValue: String, _ toValue: String,_ value: Double) -> String {
        switch fromValue {
        case "Inch":
            switch toValue {
            case "Inch":
                return "\(value)"
            case "Centimeter":
                return "\(value * 2.54)"
            case "Foot":
                return "\(value * 0.0833333)"
            case "Meter":
                return "\(value * 0.0254)"
            default:
                return ""
            }
        case "Centimeter":
            switch toValue {
            case "Inch":
                return "\(value * 0.393701)"
            case "Centimeter":
                return "\(value)"
            case "Foot":
                return "\(value * 0.0328084)"
            case "Meter":
                return "\(value * 0.01)"
            default:
                return ""
            }
        case "Foot":
            switch toValue {
            case "Inch":
                return "\(value * 12)"
            case "Centimeter":
                return "\(value * 30.48)"
            case "Foot":
                return "\(value)"
            case "Meter":
                return "\(value * 0.3048)"
            default:
                return ""
            }
        case "Meter":
            switch toValue {
            case "Inch":
                return "\(value * 39.3701)"
            case "Centimeter":
                return "\(value * 100)"
            case "Foot":
                return "\(value * 3.28084)"
            case "Meter":
                return "\(value)"
            default:
                return ""
            }
        default:
            return ""
        }
    }

    // MARK: - action

    @IBAction func convetButtonTouchUpInSide(_ sender: UIButton) {
        if leftTextFieldInput {
            guard  let leftValue = leftValueTextField.text, let value = Double(leftValue) else {
                return
            }
            let fromValue = pickerData[myPickerView.selectedRow(inComponent: 0)]
            let toValue = pickerData[myPickerView.selectedRow(inComponent: 1)]
            rightValueTextField.text = convertTo(fromValue, toValue, value)
        } else if rightTextFieldInput {
            guard let rightValue = rightValueTextField.text, let value = Double(rightValue) else {
                return
            }
            let toValue = pickerData[myPickerView.selectedRow(inComponent: 0)]
            let fromValue = pickerData[myPickerView.selectedRow(inComponent: 1)]
            leftValueTextField.text = convertTo(fromValue, toValue, value)
        }
    }
}

// MARK: - extension

extension Ex5ViewController: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == leftValueTextField {
            leftValueTextField.resignFirstResponder()
            let fromValue = pickerData[myPickerView.selectedRow(inComponent: 0)]
            let toValue = pickerData[myPickerView.selectedRow(inComponent: 1)]
            if let valueOfTextField = leftValueTextField.text, let value = Double(valueOfTextField) {
                rightValueTextField.text = convertTo(fromValue, toValue, value)
            }
        } else if textField == rightValueTextField {
            rightValueTextField.resignFirstResponder()
            let toValue = pickerData[myPickerView.selectedRow(inComponent: 0)]
            let fromValue = pickerData[myPickerView.selectedRow(inComponent: 1)]
            if let valueOfTextField = rightValueTextField.text, let value = Double(valueOfTextField) {
                leftValueTextField.text = convertTo(fromValue, toValue, value)
            }
        }
        return true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return String(pickerData[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let toValue = pickerData[myPickerView.selectedRow(inComponent: 0)]
            let fromValue = pickerData[myPickerView.selectedRow(inComponent: 1)]
            if let valueOfTextField = rightValueTextField.text, let value = Double(valueOfTextField) {
                leftValueTextField.text = convertTo(fromValue, toValue, value)
            }
        } else {
            let fromValue = pickerData[myPickerView.selectedRow(inComponent: 0)]
            let toValue = pickerData[myPickerView.selectedRow(inComponent: 1)]
            if let valueOfTextField = leftValueTextField.text, let value = Double(valueOfTextField) {
                rightValueTextField.text = convertTo(fromValue, toValue, value)
            }
        }
    }
}

