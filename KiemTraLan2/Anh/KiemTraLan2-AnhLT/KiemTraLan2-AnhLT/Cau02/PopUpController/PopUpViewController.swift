//
//  PopUpViewController.swift
//  KiemTraLan2-AnhLT
//
//  Created by PCI0013 on 8/5/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    var myPopUp: MyPopUpView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        myPopUp = Bundle.main.loadNibNamed("MyPopUpView", owner: self, options: nil)?.first as? MyPopUpView
        myPopUp?.config()
        myPopUp?.delegate = self
        self.view.addSubview(myPopUp!)
    }

    func config() {
        editButton.layer.cornerRadius = 10
        nameLabel.layer.borderWidth = 1
    }
    
    @IBAction func editButtonTouchUpInside(_ sender: Any) {
        myPopUp?.show(animation: true)
    }
}

extension PopUpViewController: MyPopUpViewDelegate {
    func myPopUp(popUpView: MyPopUpView, needPerform action: MyPopUpView.Action, editedName: String?) {
        switch action {
        case .show:
            print("show")
        case .hide:
            print("hide")
        case .showName:
            let userName = popUpView.usernameTextField.text
            nameLabel.text = userName
            
        case .done:
            print("done")
        }
    }
}
