//
//  MyPickerViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/23/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class MyPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let pickerDatas: [String] = ["inch", "centimeter", "foot", "meter"]
    private var number1 = 0.0
    private var number2 = 0.0
    private var str1 = ""
    private var str2 = ""
    private var myStr1 = ""
    private var myStr2 = ""
    //    private var value1 = ""
    //    private var value2 = ""
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var myPickerView: UIPickerView!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDatas.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDatas[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as! UILabel?
        if view == nil {
            pickerLabel = UILabel()
            let hue = CGFloat(row)/CGFloat(pickerDatas.count)
            pickerLabel?.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        }
        let titleData = pickerDatas[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 26.0)!,NSAttributedString.Key.foregroundColor:UIColor.blue])
        pickerLabel!.attributedText = myTitle
        pickerLabel!.textAlignment = .center
        return pickerLabel!
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0 :
            str1 = pickerDatas[row]
        case 1 :
            str2 = pickerDatas[row]
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        myPickerView.delegate = self
        myPickerView.dataSource = self
        self.textField1.text = myStr1
        self.textField2.text = myStr2
        str1 = pickerDatas[myPickerView.selectedRow(inComponent: 0)]
        str2 = pickerDatas[myPickerView.selectedRow(inComponent: 0)]
    }
    
    func configUI() {
        title = "Convert  "
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    func converion1() {
        guard let text = textField1.text, let num = Double(text) else { return }
        number1 = num
        if str1 == "inch" {
            if str2 == "inch" {
                number2 = number1 * 1.0
                textField2.text = String(number2)
            }
            if str2 == "centimeter" {
                number2 = number1 * 2.54
                textField2.text = String(number2)
            }
            if str2 == "foot" {
                number2 = number1 * 0.083
                textField2.text = String(number2)
            }
            if str2 == "meter" {
                number2 = number1 * 0.0254
                textField2.text = String(number2)
            }
        }
        if str1 == "centimeter" {
            if str2 == "inch" {
                number2 = number1 * 0.39
                textField2.text = String(number2)
            }
            if str2 == "centimeter" {
                number2 = number1 * 1.0
                textField2.text = String(number2)
            }
            if str2 == "foot" {
                number2 = number1 * 0.033
                textField2.text = String(number2)
            }
            if str2 == "meter" {
                number2 = number1 * 0.01
                textField2.text = String(number2)
            }
        }
        if str1 == "foot" {
            if str2 == "inch" {
                number2 = number1 * 12
                textField2.text = String(number2)
            }
            if str2 == "centimeter" {
                number2 = number1 * 30.48
                textField2.text = String(number2)
            }
            if str2 == "foot" {
                number2 = number1 * 1.0
                textField2.text = String(number2)
            }
            if str2 == "meter" {
                number2 = number1 * 0.3048
                textField2.text = String(number2)
            }
        }
        if str1 == "meter" {
            if str2 == "inch" {
                number2 = number1 * 39.3701
                textField2.text = String(number2)
            }
            if str2 == "centimeter" {
                number2 = number1 * 100
                textField2.text = String(number2)
            }
            if str2 == "foot" {
                number2 = number1 * 3.28084
                textField2.text = String(number2)
            }
            if str2 == "meter" {
                number2 = number1 * 1.0
                textField2.text = String(number2)
            }
        }
    }
    
    func converion2() {
        guard let text = textField2.text, let num = Double(text) else { return }
        number2 = num
        if str2 == "inch" {
            if str1 == "inch" {
                number1 = number2 * 1.0
                textField1.text = String(number1)
            }
            if str1 == "centimeter" {
                number2 = number1 * 2.54
                textField1.text = String(number1)
            }
            if str1 == "foot" {
                number2 = number1 * 0.083
                textField1.text = String(number1)
            }
            if str1 == "meter" {
                number2 = number1 * 0.0254
                textField1.text = String(number1)
            }
        }
        if str2 == "centimeter" {
            if str1 == "inch" {
                number1 = number2 * 0.39
                textField1.text = String(number2)
            }
            if str1 == "centimeter" {
                number1 = number2 * 1.0
                textField1.text = String(number1)
            }
            if str1 == "foot" {
                number1 = number2 * 0.033
                textField1.text = String(number1)
            }
            if str1 == "meter" {
                number1 = number2 * 0.01
                textField1.text = String(number1)
            }
        }
        if str2 == "foot" {
            if str1 == "inch" {
                number1 = number2 * 12
                textField1.text = String(number1)
            }
            if str1 == "centimeter" {
                number1 = number2 * 30.48
                textField1.text = String(number1)
            }
            if str1 == "foot" {
                number1 = number2 * 1.0
                textField1.text = String(number1)
            }
            if str1 == "meter" {
                number1 = number2 * 0.3048
                textField1.text = String(number1)
            }
        }
        if str2 == "meter" {
            if str1 == "inch" {
                number1 = number2 * 39.3701
                textField1.text = String(number1)
            }
            if str1 == "centimeter" {
                number1 = number2 * 100
                textField2.text = String(number1)
            }
            if str1 == "foot" {
                number1 = number2 * 3.28084
                textField1.text = String(number1)
            }
            if str1 == "meter" {
                number1 = number2 * 1.0
                textField1.text = String(number1)
            }
        }
    }
    
    func resetAll() {
        number1 = 0
        number2 = 0
        textField1.text = ""
        textField2.text = ""
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        converion1()
        converion2()
    }
    
    @IBAction func resetAllButton(_ sender: UIButton) {
        resetAll()
    }
}
