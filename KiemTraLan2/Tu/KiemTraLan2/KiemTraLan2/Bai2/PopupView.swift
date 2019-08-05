//
//  PopupView.swift
//  KiemTraLan2
//
//  Created by PCI0001 on 8/5/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

protocol PopupViewDelegate: class {
    func popupView(view: PopupView, needPerform action: PopupView.Action, edittedName: String?)
}

class PopupView: UIView {
    enum Action {
        case showName
        case done
        case show
        case hide
    }
    
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var markView: UIView!
    @IBOutlet weak var containerView: UIView!
    weak var delegate: PopupViewDelegate?
    
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
                    delegate.popupView(view: self, needPerform: .show, edittedName: nil)
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
                    delegate.popupView(view: self, needPerform: .hide, edittedName: nil)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }
    

    @IBAction func showNameButtonTouchUpInside(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.popupView(view: self, needPerform: .showName, edittedName: editNameTextField.text)
        }
        editNameTextField.text?.removeAll()
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.popupView(view: self, needPerform: .done, edittedName: nil)
        }
        editNameTextField.text?.removeAll()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(animation: true)
        editNameTextField.text?.removeAll()
    }
}
