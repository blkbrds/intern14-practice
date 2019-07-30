//
//  Ex7ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex7ViewController: BaseViewController {

    // MARK: outlet

    @IBOutlet weak var myDatePickerTextField: UITextField!
    @IBOutlet weak var blurView: UIView!

    // MARK: properties

    var exercise: Exercise?
    let myPickerView = MyDatePickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: config

    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        myDatePickerTextField.addTarget(self, action: #selector(inputViewDatePicker), for: .touchDown)
        myDatePickerTextField.inputView = myPickerView
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelButtonAction))
        toolBar.setItems([doneButton, spaceButton, cancelButton], animated: true)
        myDatePickerTextField.inputAccessoryView = toolBar
    }

    override func setupData() {
    }

    // MARK: customer func

    @objc func inputViewDatePicker() {
        blurView.isHidden = false
    }

    @objc func doneButtonAction() {
        blurView.isHidden = true
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        myDatePickerTextField.text = formatter.string(from: myPickerView.date)
        self.view.endEditing(true)
    }

    @objc func cancelButtonAction() {
        blurView.isHidden = true
        myDatePickerTextField.resignFirstResponder()
    }
}
