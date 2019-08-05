//
//  MyPopUp.swift
//  KiemTraLan2-AnhLT
//
//  Created by PCI0013 on 8/5/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

protocol MyPopUpViewDelegate: class {
    func myPopUp(popUpView: MyPopUpView, needPerform action: MyPopUpView.Action, editedName: String?)
}

class MyPopUpView: UIView {
    @IBOutlet weak var markView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var showNameButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    weak var delegate: MyPopUpViewDelegate?
    
    enum Action {
        case done
        case showName
        case show
        case hide
    }
    
    override func awakeFromNib() {
        config()
    }
    
    func config() {
        showNameButton.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 10
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        
        self.frame = UIScreen.main.bounds
        hide(animation: false)
    }
    
    func show(animation: Bool) {
        self.isHidden = false
        var frame = containerView.frame
        frame.origin.y -= frame.size.height + 400
        
        if animation {
            UIView.animate(withDuration: 0.3, animations: {
                self.containerView.frame = frame
                self.markView.alpha = 1
            }) { (done) in
                if let delegate = self.delegate {
                    delegate.myPopUp(popUpView: self, needPerform: .show, editedName: nil)
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
                if let delegate = self.delegate {
                    delegate.myPopUp(popUpView: self, needPerform: .hide
                        , editedName: nil)
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
            delegate.myPopUp(popUpView: self, needPerform: .showName, editedName: usernameTextField.text)
            
        }
    }
    
    @IBAction func doneButtonTouchUpInside(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.myPopUp(popUpView: self, needPerform: .done, editedName: nil)
        }
    }
}

