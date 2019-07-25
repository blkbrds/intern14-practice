//
//  MyPickerView.swift
//  CustomView
//
//  Created by PCI0008 on 7/25/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class MyPickerView: UIView {
    @IBOutlet private weak var pickerView: UIPickerView!
    private let pickerData: [String] = ["inch", "centimeter", "foot", "meter", "kilometer"]
    
    override func awakeFromNib() {
    }
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            return 10
//        } else {
//            return 100
//        }
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return "First \(row)"
//        } else {
//            return "Second \(row)"
//        }
//    }
}
