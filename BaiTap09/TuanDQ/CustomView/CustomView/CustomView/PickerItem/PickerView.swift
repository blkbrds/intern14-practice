//
//  PickerView.swift
//  CustomView
//
//  Created by MBA0051 on 10/4/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PickerView: ParentView {
    
    let data: [String] = ["1","2","3"]

    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        fromPicker.dataSource = self
        fromPicker.delegate = self
    }
}

extension PickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
     }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
     }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return data[row]
        }
        if component == 1 {
            return data[row]
        }
        if component == 2 {
            return data[row]
        }
        return nil
      }
    
}

extension PickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("-->\(row)")
     }
}
