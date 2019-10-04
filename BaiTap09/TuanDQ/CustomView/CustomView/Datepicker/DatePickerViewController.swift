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
   
    var picker: MyDatePickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView
        picker?.config()
        self.view.addSubview(picker!)
    }
    
    @IBAction func showPicker(_ sender: Any) {
        self.picker?.show(animation: true)
    }
}


extension DatePickerViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //self.picker?.show(animation: true)
        return true
    }
}
