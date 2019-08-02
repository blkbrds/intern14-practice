//
//  Ex01ViewController.swift
//  Custom View
//
//  Created by PCI0007 on 7/23/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var value2TextField: UITextField!
    @IBOutlet weak var value3TextField: UITextField!
    var sliderView = MySliderView()
    var sliderView2 = MySliderView()
    var sliderView3 = MySliderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bai 2"
        
        if let sliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView {
            self.sliderView = sliderView
        }
        sliderView.type = .view1
        sliderView.frame = CGRect(x: 0, y: 300, width: 414, height: 156)
        sliderView.delegate = self
        view.addSubview(sliderView)
        
        if let sliderView2 = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView {
            self.sliderView2 = sliderView2
        }
        sliderView2.type = .view2
        sliderView2.frame = CGRect(x: 0, y: 500, width: 414, height: 156)
        sliderView2.delegate = self
        view.addSubview(sliderView2)
        
        if let sliderView3 = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView {
            self.sliderView3 = sliderView3
        }
        sliderView3.type = .view3
        sliderView3.frame = CGRect(x: 0, y: 700, width: 414, height: 156)
        sliderView3.delegate = self
        view.addSubview(sliderView3)
        valueTextField.delegate = self
    }
}

extension Ex02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let intValue = Int(textField.text ?? "0") else { return true }
        if intValue >= 0 && intValue <= 100 {
            if textField == valueTextField {
                sliderView.changePosition(intValue)
                value2TextField.becomeFirstResponder()
            } else if textField == value2TextField {
                sliderView2.changePosition(intValue)
                value3TextField.becomeFirstResponder()
            } else if textField == value3TextField {
                sliderView3.changePosition(intValue)
                valueTextField.becomeFirstResponder()
            }
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid Input", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        return true
    }
}

extension Ex02ViewController: MySliderViewDelegate {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .changePercent(let result, let type):
            switch type {
            case .view1:
                valueTextField.text = "\(result)"
            case .view2:
                value2TextField.text = "\(result)"
            case .view3:
                value3TextField.text = "\(result)"
            }

        }
    }
}

