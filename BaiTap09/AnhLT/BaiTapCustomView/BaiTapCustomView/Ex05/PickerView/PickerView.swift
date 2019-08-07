//
//  PickerView.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/29/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate: class {
    func myDatePicker(pickerView: PickerView, needPerform action: PickerView.Action, selectedDate: Date? )
}

class PickerView: UIView {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var markView: UIView!
    weak var delegate: DatePickerViewDelegate?
    
    enum Action {
        case show
        case hide
        case done
        case cancel
    }
    //MARK: - Public functions
    func config() {
        self.frame = UIScreen.main.bounds
        hide(animation: false)
    }
    
    func show(animation: Bool) {
        self.isHidden = false
        var frame = containerView.frame
        frame.origin.y -= frame.size.height
        markView.alpha = 0.3

        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
            }) { (done) in
                if let delegate = self.delegate {
                    delegate.myDatePicker(pickerView: self, needPerform: .show
                        , selectedDate: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            markView.alpha = 0.3
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
                self.isHidden = true
                if let delegate = self.delegate {
                    delegate.myDatePicker(pickerView: self, needPerform: .hide, selectedDate: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.isHidden = true
            markView.alpha = 0
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        hide(animation: true)
        delegate?.myDatePicker(pickerView: self, needPerform: .cancel, selectedDate: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        hide(animation: true)
        delegate?.myDatePicker(pickerView: self, needPerform: .done, selectedDate: datePickerView.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(animation: true)
    }
}

