//
//  Bai6ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/31/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePickerTextField: UITextField!
    var datePickerView: MyDatePickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerTextField.delegate = self
        
        datePickerView = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView
        datePickerView?.config()
        datePickerView?.delegate = self
        self.view.addSubview(datePickerView!)
    }
}

extension DatePickerViewController: MyDatePickerViewDelegate {
    func myDatePicker(pickerView: MyDatePickerView, needPerform action: MyDatePickerView.Action, selectedDate: Date?) {
        switch action {
        case .show:
            print("show")
        case .hide:
            print("hide")
        case .cancel:
            print("cancel")
        case .done:
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM dd, yyyy"
            datePickerTextField.text = formatter.string(from: selectedDate!)
        }
    }
}

extension DatePickerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.datePickerView?.show(animation: true)
        return false
    }
}
