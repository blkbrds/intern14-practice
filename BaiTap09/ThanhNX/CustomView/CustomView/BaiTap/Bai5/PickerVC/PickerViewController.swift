//
//  Bai5ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/25/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class PickerViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet private weak var leftTextField: UITextField!
    @IBOutlet private weak var rightTextField: UITextField!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var convertButton: UIButton!
    
    private var number1 = 0.0
    private var number2 = 0.0
    private var str1: String = "inch"
    private var str2: String = "inch"
    private var isFocusLeft: Bool = true
    
    private let pickerData: [String] = ["inch", "centimeter", "foot", "meter", "kilometer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Custom PickerView"
        convertButton.layer.cornerRadius = 20
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func changeLengthLeftToRight(str1: String, str2: String) -> Double {
        guard let text = leftTextField.text, let num1 = Double(text) else { return 0 }
        number1 = num1
        
        if str1 == "inch" {
            if str2 == "inch" {
                number2 = number1
            } else if str2 == "centimeter" {
                number2 = number1 * 2.54
            } else if str2 == "foot" {
                number2 = number1 * 0.083333
            } else if str2 == "meter" {
                number2 = number1 * 0.0254
            } else if str2 == "kilometer" {
                number2 = number1 * 2.54e-5
            }
        } else if str1 == "centimeter" {
            if str2 == "inch" {
                number2 = number1 * 0.3937
            } else if str2 == "centimeter" {
                number2 = number1
            } else if str2 == "foot" {
                number2 = number1 * 0.0328084
            } else if str2 == "meter" {
                number2 = number1 * 0.01
            } else if str2 == "kilometer" {
                number2 = number1 * 1e-5
            }
        } else if str1 == "foot" {
            if str2 == "inch" {
                number2 = number1 * 12
            } else if str2 == "centimeter" {
                number2 = number1 * 30.48
            } else if str2 == "foot" {
                number2 = number1
            } else if str2 == "meter" {
                number2 = number1 * 0.3048
            } else if str2 == "kilometer" {
                number2 = number1 * 0.0003048
            }
        } else if str1 == "meter" {
            if str2 == "inch" {
                number2 = number1 * 39.3701
            } else if str2 == "centimeter" {
                number2 = number1 * 100
            } else if str2 == "foot" {
                number2 = number1 * 3.28084
            } else if str2 == "meter" {
                number2 = number1
            } else if str2 == "kilometer" {
                number2 = number1 * 0.001
            }
        } else if str1 == "kilometer" {
            if str2 == "inch" {
                number2 = number1 * 39370.1
            } else if str2 == "centimeter" {
                number2 = number1 * 100000
            } else if str2 == "foot" {
                number2 = number1 * 3280.84
            } else if str2 == "meter" {
                number2 = number1 * 1000
            } else if str2 == "kilometer" {
                number2 = number1
            }
        }
        return number2
    }
    
    private func changeLengthRightToLeft(str1: String, str2: String) -> Double {
        guard let text = rightTextField.text, let num2 = Double(text) else { return 0 }
        number2 = num2
        
        if str1 == "inch" {
            if str2 == "inch" {
                number1 = number2
            } else if str2 == "centimeter" {
                number1 = number2 * 2.54
            } else if str2 == "foot" {
                number1 = number2 * 0.083333
            } else if str2 == "meter" {
                number1 = number2 * 0.0254
            } else if str2 == "kilometer" {
                number1 = number2 * 2.54e-5
            }
        } else if str1 == "centimeter" {
            if str2 == "inch" {
                number1 = number2 * 0.3937
            } else if str2 == "centimeter" {
                number1 = number2
            } else if str2 == "foot" {
                number1 = number2 * 0.0328084
            } else if str2 == "meter" {
                number1 = number2 * 0.01
            } else if str2 == "kilometer" {
                number1 = number2 * 1e-5
            }
        } else if str1 == "foot" {
            if str2 == "inch" {
                number1 = number2 * 12
            } else if str2 == "centimeter" {
                number1 = number2 * 30.48
            } else if str2 == "foot" {
                number1 = number2
            } else if str2 == "meter" {
                number1 = number2 * 0.3048
            } else if str2 == "kilometer" {
                number1 = number2 * 0.0003048
            }
        } else if str1 == "meter" {
            if str2 == "inch" {
                number1 = number2 * 39.3701
            } else if str2 == "centimeter" {
                number1 = number2 * 100
            } else if str2 == "foot" {
                number1 = number2 * 3.28084
            } else if str2 == "meter" {
                number1 = number2
            } else if str2 == "kilometer" {
                number1 = number2 * 0.001
            }
        } else if str1 == "kilometer" {
            if str2 == "inch" {
                number1 = number2 * 39370.1
            } else if str2 == "centimeter" {
                number1 = number2 * 100000
            } else if str2 == "foot" {
                number1 = number2 * 3280.84
            } else if str2 == "meter" {
                number1 = number2 * 1000
            } else if str2 == "kilometer" {
                number1 = number2
            }
        }
        return number1
    }
    
    //MARK: Button Convert
    @IBAction private func convertButtonTouchUpInside(_ sender: UIButton) {
        if isFocusLeft {
            rightTextField.text = String(changeLengthLeftToRight(str1: str1, str2: str2))
        } else {
            leftTextField.text = String(changeLengthRightToLeft(str1: str1, str2: str2))
        }
    }
}

//MARK: TextField Delegate
extension PickerViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isFocusLeft = textField == leftTextField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == leftTextField {
            rightTextField.text = String(changeLengthLeftToRight(str1: str1, str2: str2))
        } else if textField == rightTextField {
            leftTextField.text = String(changeLengthRightToLeft(str1: str1, str2: str2))
        }
        return true
    }
}

//MARK: PickerView Delegate
extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let leftValue = pickerData[pickerView.selectedRow(inComponent: 0)]
        let rightValue = pickerData[pickerView.selectedRow(inComponent: 1)]
        if component == 0 {
            str1 = leftValue
        } else {
            str2 = rightValue
        }
    }
}

//MARK: PickerView DataSource
extension PickerViewController: UIPickerViewDataSource {
    //MARK: Number of Column of Data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //MARK: Number of Rows of Data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
