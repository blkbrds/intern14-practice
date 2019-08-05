//
//  InfoViewController.swift
//  test2
//
//  Created by PCI0007 on 8/5/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var editButton: UIButton!
    
    
    var customPopUp = PopUp()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let popUp = Bundle.main.loadNibNamed("PopUp", owner: self, options: nil)?[0] as? PopUp {
            self.customPopUp = popUp
            popUp.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: popUp.bounds.height)
            self.view.addSubview(popUp)
        }
        nameTextField.delegate = self
        customPopUp.delegate = self
        customPopUp.isHidden = false
        nameTextField.isHidden = false

    }


    @IBAction func editButtonTouchUpInside(_ sender: UIButton) {
        customPopUp.isHidden = false
        customPopUp.show(animation: true)
    }
    

}

extension InfoViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        return true
    }
}

extension InfoViewController: PopUpDelegate {
    func view(view: PopUp, needPerformAction action: PopUp.Action, name: String?) {
        switch action {
        case .done:
            print("tap")
        case .showName:
            nameTextField.text = name
            
        }
    }
}

