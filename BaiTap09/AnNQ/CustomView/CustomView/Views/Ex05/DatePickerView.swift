//
//  DatePickerView.swift
//  CustomView
//
//  Created by MBA0217 on 10/1/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate :class {
    func setDateTimeNow(strDate: String)
}

class DatePickerView: UIView {
    @IBOutlet weak var datePickerView: UIDatePicker!
    var strDate: String?
    weak var delegate: DatePickerViewDelegate?
    
    static func loadNibNamed() -> DatePickerView {
        let view = Bundle.main.loadNibNamed("DatePickerView", owner: self, options: nil)?[0] as! DatePickerView
//        view.datePickerView.dataSource = view
//        view.datePickerView.delegate = view
        return view
    }
    
    @IBAction func valueChangeDateTime(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.medium
        
        self.strDate = dateFormatter.string(from: datePickerView.date)
        if let delegate = self.delegate {
            delegate.setDateTimeNow(strDate: self.strDate!)
        } else {
            print("delegate is not exists")
        }
    }
}

