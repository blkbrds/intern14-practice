//
//  CustomPicker.swift
//  Custom View
//
//  Created by PCI0007 on 7/31/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

protocol CustomPickerDelegate: class {
    func customPicker(pickerView: CustomPickerView, needPerformAction action: CustomPickerView.Action, selectedDate: Date?)
}

class CustomPickerView: UIView {
    enum Action {
        case done
        case cancel
    
    }
    

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    weak var delegate: CustomPickerDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        datePicker.datePickerMode = .date
        hide(animation: false)
    }
    
    func hide(animation: Bool) {
        var frame = self.frame
        frame.origin.y += frame.size.height
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.frame = frame
                self.mask?.alpha = 0
            }) { (done) in
                //delegate
                self.isHidden = true
                if let delegate = self.delegate {
                    delegate.customPicker(pickerView: self, needPerformAction: .done, selectedDate: nil)
                }
            }
        } else {
            self.frame = frame
            self.mask?.alpha = 0
            self.isHidden = true
        }
    }
    
    func show(animation: Bool) {
        self.isHidden = false
        var frame = self.frame
        frame.origin.y -= frame.size.height
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.frame = frame
                self.mask?.alpha = 0.3
            }) { (done) in
                //delegate
                if let delegate = self.delegate {
                    delegate.customPicker(pickerView: self, needPerformAction: .done, selectedDate: nil)
                }
            }
        } else {
            self.frame = frame
            self.mask?.alpha = 0.3
        }
    }
        
    @IBAction func doneButtonTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.customPicker(pickerView: self, needPerformAction: .done, selectedDate: self.datePicker.date)
        self.isHidden = false
        hide(animation: true)
    }
    
    @IBAction func cancelButtonTouchUpInside(_ sender: UIBarButtonItem) {
        delegate?.customPicker(pickerView: self, needPerformAction: .cancel, selectedDate: nil)
        hide(animation: true)
   
    }
    
}
 


