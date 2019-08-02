//
//  Ex05ViewController.swift
//  Custom View
//
//  Created by PCI0007 on 7/30/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class PickerView: UIViewController {
  

    @IBOutlet weak var convertButton: UIButton!
        @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var exPickerView: UIPickerView!
    let data: [String] = ["inch", "centimeter", "foot", "yard"]
    var type1: String = ""
    var type2: String = ""
    var text1: String = ""
    var text2: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exPickerView.delegate = self
        self.exPickerView.dataSource = self
        exPickerView.isHidden = false
        leftTextField.delegate = self
        rightTextField.delegate = self
        adjustDetails()
        
    }
    
    func adjustDetails() {
        exPickerView.layer.borderWidth = 1
        exPickerView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        exPickerView.layer.cornerRadius = 40
        leftTextField.layer.borderWidth = 1
        rightTextField.layer.borderWidth = 1
        rightTextField.layer.cornerRadius = 16
        leftTextField.layer.cornerRadius = 16
    }

    @IBAction func convertButtonTouchUpInside(_ sender: UIButton) {
        leftTextField.text = nil
        rightTextField.text = nil
    }
    
    func convertValue2(type1: String, type2: String) {
        let intValue = Double(leftTextField.text ?? "0")
        guard let value = intValue else { return }
            if type1 == type2 {
            text1 = text2
        } else if type1 == "inch" {
            if type2 == "centimeter" {
                text1 = String(value * 2.54)
            } else if type2 == "foot" {
                text1 = String(value * 1 / 12)
            } else if type2 == "meter" {
                text1 = String(value * 0.0254)
            } else if type2 == "yard" {
                text1 = String(value / 36)
            }
        } else if type1 == "centimeter" {
            if type2 == "inch" {
                text1 = String(value / 2.54)
            } else if type2 == "foot" {
                text1 = String(value / 30.48)
            } else if type2 == "yard" {
                text1 = String(value / 91.44)
            }
        } else if type1 == "foot" {
            if type2 == "centimeter" {
                text1 = String(value * 30.48)
            } else if type2 == "inch" {
                text1 = String(value * 12)
            } else if type2 == "yard" {
                text1 = String(value / 3)
            }
        } else if type1 == "yard" {
            if type2 == "centimeter" {
                text1 = String(value * 91.44)
            } else if type2 == "inch" {
                text1 = String(value * 36)
            } else if type2 == "foot" {
                text1 = String(value * 3)
            }
        }
    }
}

extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            leftTextField.placeholder = "\(data[row])"
            return data[row]
        } else {
            rightTextField.placeholder = "\(data[row])"
            return data[row]
        }
    }
}

extension PickerView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == leftTextField {
            let intValue = Double(leftTextField.text ?? "0")
            guard let value = intValue else { return true}
            if leftTextField.placeholder == rightTextField.placeholder {
                rightTextField.text = leftTextField.text
            } else if leftTextField.placeholder == "inch" {
                if rightTextField.placeholder == "centimeter" {
                    rightTextField.text = String(value * 2.54)
                } else if rightTextField.placeholder == "foot" {
                    rightTextField.text = String(value * 1 / 12)
                } else if rightTextField.placeholder == "meter" {
                    rightTextField.text = String(value * 0.0254)
                } else if rightTextField.placeholder == "yard" {
                    rightTextField.text = String(value / 36)
                }
            } else if leftTextField.placeholder == "centimeter" {
                if rightTextField.placeholder == "inch" {
                    rightTextField.text = String(value / 2.54)
                } else if rightTextField.placeholder == "foot" {
                    rightTextField.text = String(value / 30.48)
                } else if rightTextField.placeholder == "yard" {
                    rightTextField.text = String(value / 91.44)
                }
            } else if leftTextField.placeholder == "foot" {
                if rightTextField.placeholder == "centimeter" {
                    rightTextField.text = String(value * 30.48)
                } else if rightTextField.placeholder == "inch" {
                    rightTextField.text = String(value * 12)
                } else if rightTextField.placeholder == "yard" {
                    rightTextField.text = String(value / 3)
                }
            } else if leftTextField.placeholder == "yard" {
                if rightTextField.placeholder == "centimeter" {
                    rightTextField.text = String(value * 91.44)
                } else if rightTextField.placeholder == "inch" {
                    rightTextField.text = String(value * 36)
                } else if rightTextField.placeholder == "foot" {
                    rightTextField.text = String(value * 3)
                }
            }
        } else if textField == rightTextField {
            let intValue = Double(rightTextField.text ?? "0")
            guard let value = intValue else { return true}
//            guard let type1 = rightTextField.placeholder else { return true}
//            guard let type2 = leftTextField.placeholder else { return true}
//            rightTextField.text = text1
//            leftTextField.text = text2
//            convertValue2(type1: type1, type2: type2)
            if rightTextField.placeholder == leftTextField.placeholder {
                leftTextField.text = rightTextField.text
            } else if rightTextField.placeholder == "inch" {
                if leftTextField.placeholder == "centimeter" {
                    leftTextField.text = String(value * 2.54)
                } else if leftTextField.placeholder == "foot" {
                    leftTextField.text = String(value * 1 / 12)
                } else if leftTextField.placeholder == "meter" {
                    leftTextField.text = String(value * 0.0254)
                } else if leftTextField.placeholder == "yard" {
                    leftTextField.text = String(value / 36)
                }
            } else if rightTextField.placeholder == "centimeter" {
                if leftTextField.placeholder == "inch" {
                    leftTextField.text = String(value / 2.54)
                } else if leftTextField.placeholder == "foot" {
                    leftTextField.text = String(value / 30.48)
                } else if leftTextField.placeholder == "yard" {
                    leftTextField.text = String(value / 91.44)
                }
            } else if rightTextField.placeholder == "foot" {
                if leftTextField.placeholder == "centimeter" {
                    leftTextField.text = String(value * 30.48)
                } else if leftTextField.placeholder == "inch" {
                    leftTextField.text = String(value * 12)
                } else if leftTextField.placeholder == "yard" {
                    leftTextField.text = String(value / 3)
                }
            } else if rightTextField.placeholder == "yard" {
                if leftTextField.placeholder == "centimeter" {
                    leftTextField.text = String(value * 91.44)
                } else if leftTextField.placeholder == "inch" {
                    leftTextField.text = String(value * 36)
                } else if leftTextField.placeholder == "foot" {
                    leftTextField.text = String(value * 3)
                }
            }
        }
        return true
    }
}
