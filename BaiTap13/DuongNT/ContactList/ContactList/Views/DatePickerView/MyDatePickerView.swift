//
//  MyDatePickerView.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/31/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

protocol MyDatePickerViewDelegate: class {
    func myDatePicker(pickerView: MyDatePickerView, needPerform action: MyDatePickerView.Action, selectedDate: Date?)
}

class MyDatePickerView: UIView {

    enum Action {
        case done
        case cancel
        case show
        case hide
    }

    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var markView: UIView!
    @IBOutlet weak var containerView: UIView!

    var delegate: MyDatePickerViewDelegate?

    //MARK: - public functions
    func config() {
        self.frame = UIScreen.main.bounds
        hide(animation: false)
    }

    func show(animation: Bool) {
        self.isHidden = false
        var frame = containerView.frame
        
        frame.origin.y -= frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 0.3
            }) { (done) in
                //delegate
                if let delegate = self.delegate {
                    delegate.myDatePicker(pickerView: self, needPerform: .show, selectedDate: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0.3
        }
    }

    func hide(animation: Bool) {
        var frame = containerView.frame
        
        frame.origin.y += frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 0
            }) { (done) in
                //delegate
                self.isHidden = true
                if let delegate = self.delegate {
                    delegate.myDatePicker(pickerView: self, needPerform: .hide, selectedDate: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }

    //MARK: - Actions
    @IBAction func cancel(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.myDatePicker(pickerView: self, needPerform: .cancel, selectedDate: nil)
        }
    }

    @IBAction func done(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.myDatePicker(pickerView: self, needPerform: .done, selectedDate: datePickerView.date)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(animation: true)
    }
}
