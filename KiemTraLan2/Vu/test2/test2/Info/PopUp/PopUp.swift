//
//  PopUp.swift
//  test2
//
//  Created by PCI0007 on 8/5/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

protocol PopUpDelegate: class {
    func view(view: PopUp, needPerformAction action: PopUp.Action, name: String?)
}

class PopUp: UIView {
    
    enum Action {
        case done
        case showName
    }

    @IBOutlet weak var reNameTextField: UITextField!
    @IBOutlet weak var showNameButton: UIButton!
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var iconImageView: UIImageView!
    weak var delegate: PopUpDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = iconView.bounds.width / 2
        iconImageView.layer.cornerRadius = iconImageView.bounds.width / 2
        hide(animation: false)
        
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
                if let delegate = self.delegate {
                    delegate.view(view: self, needPerformAction: .done, name: nil)
                }
            }
        } else {
            self.frame = frame
            self.mask?.alpha = 0.3
        }
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
                    delegate.view(view: self, needPerformAction: .done, name: nil)
                }
            }
        } else {
            self.frame = frame
            self.mask?.alpha = 0
            self.isHidden = true
        }
    }
    
    
    @IBAction func doneButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(view: self, needPerformAction: .done,name: nil)
        self.isHidden = false
        hide(animation: true)
    }
    
    
    @IBAction func showNameButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(view: self, needPerformAction: .showName, name: reNameTextField.text)
        hide(animation: true)
   
    }
    
}
