//
//  DayPickerViewViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/23/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class DayPickerViewViewController: UIViewController {
    
    var picker: MyDayPicker?
    let formatDate = DateFormatter()
    
    @IBOutlet weak var chooseDay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker = Bundle.main.loadNibNamed("MyDayPicker", owner: self, options: nil)?.first as? MyDayPicker
        picker?.delegate = self
        title = " Day Picker View "
        navigationController?.navigationBar.backgroundColor = .cyan
        chooseDay.addTarget(self, action: #selector(showPicker), for: .touchDown)
        self.view.addSubview(picker!)
    }
    
    @objc func showPicker() {
        self.picker?.show(animation: true)
    }
    
    @IBAction func okButton(_ sender: Any) {
        chooseDay.text = nil
    }
}

extension DayPickerViewViewController: MyDayPickerDelegate {
    func myDayPicker(myPicker: MyDayPicker, needPerformAction action: MyDayPicker.Action, selectDate: Date?) {
        switch action {
        case .done:
            self.formatDate.dateFormat = "HH:mm:ss dd-MM-yyyy"
            chooseDay.text = formatDate.string(from: myPicker.datePickerView.date)
        case .cancel:
            print("Cancel")
        case .show:
            print("Show")
        case .hide:
            print("Hide")
        }
    }
}
