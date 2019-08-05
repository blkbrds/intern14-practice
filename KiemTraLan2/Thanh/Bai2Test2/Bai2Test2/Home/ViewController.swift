//
//  ViewController.swift
//  Bai2Test2
//
//  Created by PCI0008 on 8/5/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myPopupView: MyPopupView?
    
    @IBOutlet private weak var editNameTextField: UITextField!
    @IBOutlet private weak var editNameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editNameButton.layer.cornerRadius = 20
        guard let myPopupView = Bundle.main.loadNibNamed("MyPopupView", owner: self, options: nil)?.first as? MyPopupView else { return }
        self.myPopupView = myPopupView
        myPopupView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        myPopupView.delegate = self
        view.addSubview(myPopupView)
        myPopupView.designPopup()
    }
    
    @IBAction func editNameButtonTouchUpInside() {
        self.myPopupView?.show(animation: true)
    }
}

extension ViewController: MyPopupViewDelegate {
    func view(_ view: MyPopupView, needPerformAction action: MyPopupView.Action, updateName: String?) {
        switch action {
        case .show:
            break
        case .hide:
            break
        case .showName:
            guard let nameText = updateName else { return }
            editNameTextField.text = "\(nameText)"
        }
    }
}
