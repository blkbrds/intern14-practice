//
//  AdvancePickerViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/5/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class AdvancePickerViewController: UIViewController {

    @IBOutlet weak var convertPickerView: UIView!
    @IBOutlet weak var datetimePickerView: UIView!
    @IBOutlet weak var convertSourceTextField: UITextField!
    @IBOutlet weak var convertTargetTextField: UITextField!
    private let data: [String] = ["Inche", "Centimeter", "foot", "meter"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let nib = Bundle.main.loadNibNamed("ConvertPickerItem", owner: self, options: nil)?[0] as? ConvertPickerItem else {
            return
        }
        nib.settingData(initData: data)
        nib.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        nib.delegate = self
        convertPickerView.addSubview(nib)
    }
}

extension AdvancePickerViewController: ConvertPickerItemDelegate {
    func convertData(view: ConvertPickerItem, source: Int, target: Int) {
        
        var fromValue: Float?
        var toValue: Float?
        
        if convertSourceTextField?.text == nil || convertSourceTextField?.text == "" {
            fromValue = Float(convertSourceTextField.text!)!
        }
        if convertTargetTextField?.text == nil || convertTargetTextField?.text == "" {
            toValue = Float(convertTargetTextField.text!)!
        }
        
        // Convert From value to To value
        if fromValue == nil && fromValue == nil {
            return
        }
        if (fromValue == nil) {
            fromValue = transferToCentimeter(source: target, value: toValue!)
            convertSourceTextField.text = String(centimeterToOther(source: target, value: toValue ?? 0))
        } else if (toValue == nil) {
            toValue = transferToCentimeter(source: source, value: fromValue!)
            convertSourceTextField.text = String(centimeterToOther(source: source, value: fromValue ?? 0))
        }
    }
    
    private func transferToCentimeter(source: Int, value: Float) -> Float {
        switch source {
        case 0: // Inch
            return value * 2.54
        case 1: // Centimeter
            return value
        case 2: // Foot
            return value * 30.48
        case 3: // Meter
            return value * 100
        default:
            return value
        }
    }
    
    private func centimeterToOther(source: Int, value: Float) -> Float {
        switch source {
        case 0: // Inch
            return value / 2.54
        case 1: // Centimeter
            return value
        case 2: // Foot
            return value / 30.48
        case 3: // Meter
            return value / 100
        default:
            return value
        }
    }
}
