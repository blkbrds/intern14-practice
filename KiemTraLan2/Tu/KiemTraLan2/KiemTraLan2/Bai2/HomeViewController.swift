//
//  HomeViewController.swift
//  KiemTraLan2
//
//  Created by PCI0001 on 8/5/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    var popupView: PopupView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        popupView = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?.first as? PopupView
        popupView?.config()
        popupView?.delegate = self
        view.addSubview(popupView!)
    }
    
    @IBAction func editButtonTouchUpInside(_ sender: Any) {
        popupView?.show(animation: true)
    }
}

extension HomeViewController: PopupViewDelegate {
    func popupView(view: PopupView, needPerform action: PopupView.Action, edittedName: String?) {
        switch action {
        case .showName:
            nameTextField.text = edittedName
        case .done:
            print("done")
        case .show:
            print("show")
        case .hide:
            print("hide")
        }
    }
}
