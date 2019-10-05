//
//  PickerView.swift
//  CustomView
//
//  Created by MBA0051 on 10/4/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol PickerViewDelegate: class {
    func pickerView(view: PickerView, component: Int, value: String)
}

class PickerView: ParentView {
    
    let data: [String] = ["Inche", "Centimeter", "foot", "meter"]

    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    weak var delegate: PickerViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        fromPicker.dataSource = self
        fromPicker.delegate = self
    }
    @IBAction func convertCalculate(_ sender: UIButton) {
//        delegate?.getValueChange(view: self, component: 1, value: "data")
    }
}

extension PickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
     }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
     }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}

extension PickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.pickerView(view: self, component: 0, value: "12")
    }
}
