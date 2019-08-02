//
//  DatePickerViewController.swift
//  Custom View
//
//  Created by PCI0007 on 7/31/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
  
    @IBOutlet weak var valueTextField: UITextField!
    
    var customPicker = CustomPickerView()
    var datePicker = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let datePicker = Bundle.main.loadNibNamed("CustomPicker", owner: self, options: nil)?[0] as? CustomPickerView {
            self.customPicker = datePicker
            datePicker.frame = CGRect(x: 0, y: view.bounds.height, width: datePicker.bounds.width, height: datePicker.bounds.height)
            self.view.addSubview(customPicker)
            customPicker.isHidden = false
            valueTextField.delegate = self
            customPicker.delegate = self
        }
        

        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func formatDate(date: Date) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "MMMM dd, yyyy"
        let result = formater.string(from: date)
        return result
    }
    


   

}

extension DatePickerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("tap")
        customPicker.isHidden = false
        customPicker.show(animation: true)
        return false
    }
}

extension DatePickerViewController: CustomPickerDelegate {
    func customPicker(pickerView: CustomPickerView, needPerformAction action: CustomPickerView.Action, selectedDate: Date?) {
        switch action {
        case .done:
            guard let date = selectedDate else { return }
            valueTextField.text = "\(formatDate(date: date))"
        case .cancel:
            print("cancel")
        }
    }
}
