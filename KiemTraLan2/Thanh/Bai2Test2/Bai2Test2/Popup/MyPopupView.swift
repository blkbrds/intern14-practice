//
//  MyPopupView.swift
//  Bai2Test2
//
//  Created by PCI0008 on 8/5/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

protocol MyPopupViewDelegate: class {
    func view(_ view: MyPopupView, needPerformAction action: MyPopupView.Action, updateName: String?)
}

class MyPopupView: UIView {
    enum Action {
        case show
        case hide
        case showName
    }
    
    weak var delegate: MyPopupViewDelegate?
    
    @IBOutlet private weak var markView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var penView: UIView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var showNameButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    func designPopup() {
        
        showNameButton.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 10
        penView.layer.cornerRadius = penView.bounds.width / 2
        penView.layer.borderWidth = 3
        penView.layer.borderColor = UIColor.white.cgColor
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
                guard let delegate = self.delegate else { return }
                delegate.view(self, needPerformAction: .show, updateName: nil)
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
                self.isHidden = true
                guard let delegate = self.delegate else { return }
                delegate.view(self, needPerformAction: .hide, updateName: nil)
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }
    
    @IBAction func showNameButtonTouchUpInside() {
        hide(animation: true)
        guard let delegate = delegate else { return }
        guard let name = nameTextField.text else { return }
        delegate.view(self, needPerformAction: .showName, updateName: name)
    }
    
    @IBAction func doneButtonTouchUpInside() {
        hide(animation: true)
        guard let delegate = self.delegate else { return }
        delegate.view(self, needPerformAction: .hide, updateName: nil)
    }
}
