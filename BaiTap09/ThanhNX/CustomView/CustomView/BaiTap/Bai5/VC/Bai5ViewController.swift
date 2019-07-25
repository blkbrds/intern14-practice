//
//  Bai5ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/25/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

enum UnitOfLength: Int {
    case inch
    case centimeter
    case foot
    case meter
    case kilometer
}

final class Bai5ViewController: UIViewController {
    @IBOutlet private weak var leftTextField: UITextField!
    @IBOutlet private weak var rightTextField: UITextField!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var convertButton: UIButton!
    
    let pickerData: [String] = ["inch", "centimeter", "foot", "meter", "kilometer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bai 5"
        convertButton.layer.cornerRadius = 20
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func changeLength() {
        guard let leftNumber = leftTextField.text, let rightNumber = rightTextField.text else { return }
//        guard let changeUnit: UnitOfLength = UnitOfLength(rawValue: pickerData[row]) else { return 0 }
    }
    
    @IBAction func convertButtonTouchUpInside(_ sender: UIButton) {
        
    }
}

extension Bai5ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}

//MARK: PickerView Delegate
extension Bai5ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let leftValue = pickerData[pickerView.selectedRow(inComponent: 0)]
        let rightValue = pickerData[pickerView.selectedRow(inComponent: 1)]
        //        print("\(digitsValue) + \(decimalValue)")
        print(pickerData[row])
        if component == 0 {
            print("Left \(leftValue)")
        } else {
            print("Right \(rightValue)")
        }
    }
}

//MARK: PickerView DataSource
extension Bai5ViewController: UIPickerViewDataSource {
    //MARK: Number of Column of Data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //MARK: Number of Rows of Data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerData.count
        } else {
            return pickerData.count
        }
    }
    
    //MARK: The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
