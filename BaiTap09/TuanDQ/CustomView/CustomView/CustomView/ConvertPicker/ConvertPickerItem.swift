//
//  ConvertPickerItem.swift
//  CustomView
//
//  Created by MBA0051 on 10/5/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

protocol ConvertPickerItemDelegate: class {
    func convertData(view: ConvertPickerItem, source: Int, target: Int)
}

class ConvertPickerItem: ParentView {

    @IBOutlet weak var mainPicker: UIPickerView!
    @IBOutlet weak var convertButton: UIButton!
    weak var delegate: ConvertPickerItemDelegate?
    private var data: [String] = []
    private var fromValue: Int = 0
    private var toValue: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        mainPicker.dataSource = self
        mainPicker.delegate = self
    }

    func settingData(initData: [String]) {
        self.data = initData
    }
    
    @IBAction func convertCalculate(_ sender: Any) {
        delegate?.convertData(view: self, source: fromValue, target: toValue)
    }
}

/**
 * Picker view extension.
 */
extension ConvertPickerItem: UIPickerViewDataSource {
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

extension ConvertPickerItem: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            fromValue = row
        } else {
            toValue = row
        }
    }
}
