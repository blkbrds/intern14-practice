////
////  PickerView.swift
////  BaiTapCustomView
////
////  Created by PCI0001 on 7/30/19.
////  Copyright © 2019 PCI0001. All rights reserved.
////
//
//import UIKit
//
//protocol PickerViewDataSource: class {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
//}
//
//class PickerView: UIView {
//    var unitPicker: UIPickerView?
//    let units = ["inch", "foot", "meter", "centimeter", "millimeter"]
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        unitPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 400, height: 200))
//        unitPicker?.numberOfRows(inComponent: units.count)
//        
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//
//    }
//}
