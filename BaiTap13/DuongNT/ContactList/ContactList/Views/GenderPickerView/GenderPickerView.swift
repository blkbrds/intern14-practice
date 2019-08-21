//
//  GenderPickerView.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/20/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

protocol GenderPickerViewDelegate: class {
    func myGenderPicker(pickerView: GenderPickerView, needPerform action: GenderPickerView.Action, valueGenderPicker: Bool)
}

class GenderPickerView: UIView {

    enum Action {
        case done
        case cancel
        case show
        case hide
    }

    @IBOutlet private weak var genderPickerView: UIPickerView!
    @IBOutlet private weak var markView: UIView!
    @IBOutlet private weak var containerView: UIView!

    weak var delegate: GenderPickerViewDelegate?
    private let genderDataPicker: [String] = ["Male", "Female"]
    var valueGender: Bool = true

    //MARK: - public functions
    func config() {
        self.frame = UIScreen.main.bounds
        hide(animation: false)
    }

    func show(animation: Bool) {
        genderPickerView.dataSource = self
        genderPickerView.delegate = self
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
                    delegate.myGenderPicker(pickerView: self, needPerform: .show, valueGenderPicker: self.valueGender)
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
                    delegate.myGenderPicker(pickerView: self, needPerform: .hide, valueGenderPicker: self.valueGender)
                }
            }
        } else {
            self.containerView.frame = frame
            self.markView.alpha = 0
            self.isHidden = true
        }
    }

    //MARK: - Actions
    @IBAction func cancel(_ sender: Any) {
        hide(animation: true)
        if let delegate = self.delegate {
            delegate.myGenderPicker(pickerView: self, needPerform: .cancel, valueGenderPicker: valueGender)
        }
    }

    @IBAction func done(_ sender: Any) {
        hide(animation: true)
//        genderPickerView.dataSource = self
//        genderPickerView.delegate = self
        if let delegate = self.delegate {
            delegate.myGenderPicker(pickerView: self, needPerform: .done, valueGenderPicker: valueGender)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(animation: true)
    }
}

// MARK: - Extension
extension GenderPickerView: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderDataPicker.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return String(genderDataPicker[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valueOfPicker = genderDataPicker[genderPickerView.selectedRow(inComponent: 0)]
        if valueOfPicker == "Male" {
            valueGender = true
        } else {
            valueGender = false
        }
    }
}
