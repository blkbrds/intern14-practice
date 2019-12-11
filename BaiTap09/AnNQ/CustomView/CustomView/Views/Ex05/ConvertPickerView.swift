//
//  ConvertPickerView.swift
//  CustomView
//
//  Created by MBA0217 on 9/30/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol ConvertPickerViewDelegate : class {
    func convertData(convertArray: [String])
}

class ConvertPickerView: UIView {

    @IBOutlet weak var convertPicker: UIPickerView!
    weak var delegate: ConvertPickerViewDelegate?
    var convertArray = ["centimeter", "centimeter"]
    var pickerData: [[String]] = [["centimeter", "decimeter", "meter" ], ["centimeter", "decimeter", "meter" ]]
    
    static func loadNibNamed() -> ConvertPickerView {
        let view = Bundle.main.loadNibNamed("ConvertPickerView", owner: self, options: nil)?[0] as! ConvertPickerView
        view.convertPicker.dataSource = view
        view.convertPicker.delegate = view
        return view
    }
    
}

extension ConvertPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            convertArray[component] = pickerData[component][row]
            delegate?.convertData(convertArray: convertArray)
    }
    
}
