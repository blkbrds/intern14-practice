//
//  DatePickerViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/30/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var dateTextField: UITextField!
    private var myPicker: PickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.delegate = self
        myPicker = Bundle.main.loadNibNamed("PickerView", owner: self, options: nil)?.first as? PickerView
        myPicker?.delegate = self
        myPicker?.config()
        view.addSubview(myPicker!)
    }
}

extension DatePickerViewController: DatePickerViewDelegate {
    func myDatePicker(pickerView: PickerView, needPerform action: PickerView.Action, selectedDate: Date?) {
        switch action {
        case .show:
            print("show")
        case .hide:
            print("hide")
        case .cancel:
            print("cancel")
        case .done:
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            dateTextField.text = formatter.string(from: selectedDate!)
        }
    }
}

extension DatePickerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.myPicker?.show(animation: true)
        return false
    }
}


