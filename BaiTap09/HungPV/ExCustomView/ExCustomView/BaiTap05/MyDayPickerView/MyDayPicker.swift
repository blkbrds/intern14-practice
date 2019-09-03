//
//  MyDayPicker.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/23/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

protocol  MyDayPickerDelegate: class {
    func myDayPicker(myPicker: MyDayPicker, needPerformAction action: MyDayPicker.Action, selectDate: Date? )
}

class MyDayPicker: UIView {
    
    enum Action {
        case done
        case cancel
        case show
        case hide
    }
    
    @IBOutlet weak var markView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    var delegate: MyDayPickerDelegate?
    
    func show(animation: Bool) {
        self.isHidden = false
        var frame = containerView.frame
        
        frame.origin.y -= frame.size.height
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 1
            }) { (done) in
                if let delegate = self.delegate {
                    delegate.myDayPicker(myPicker: self, needPerformAction: .show, selectDate: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 1
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
                    delegate.myDayPicker(myPicker: self, needPerformAction: .hide, selectDate: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(animation: true)
    }
    
    @IBAction func done(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.myDayPicker(myPicker: self, needPerformAction: .done, selectDate: datePickerView.date)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.myDayPicker(myPicker: self, needPerformAction: .cancel, selectDate: nil)
        }
    }
}
