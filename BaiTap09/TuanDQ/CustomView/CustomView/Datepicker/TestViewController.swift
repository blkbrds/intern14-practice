//
//  TestViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/31/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var picker: MyDatePickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView
        picker?.config()
        picker?.delegate = self
        self.view.addSubview(picker!)
    }
    
    @IBAction func showPicker(_ sender: Any) {
        self.picker?.show(animation: true)
    }

}

extension TestViewController: MyDatePickerViewDelegate {
    func myDatePicker(pickerView: MyDatePickerView, needPerform action: MyDatePickerView.Action, selectedDate: Date?) {
        switch action {
        case .show:
            print("show")
        case .hide:
            print("hide")
        case .cancel:
            print("cancel")
        case .done:
            print("done: \(selectedDate!)")
        }
    }
    
}


