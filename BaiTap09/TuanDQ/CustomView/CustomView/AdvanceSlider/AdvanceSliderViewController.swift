//
//  AdvanceSliderViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/3/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class AdvanceSliderViewController: UIViewController {
    @IBOutlet weak var temperatureTextField: UITextField!
    @IBOutlet weak var humidityTextField: UITextField!
    @IBOutlet weak var windSpeedTextField: UITextField!
    
    @IBOutlet weak var temperatureView: UIView!
    @IBOutlet weak var humidityView: UIView!
    @IBOutlet weak var windSpeedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MySliderViewController"
        
        loadNibToView(view: temperatureView, text: temperatureTextField, color: .blue, start: 0.3, tag: 1)
        loadNibToView(view: humidityView, text: humidityTextField, color: .green, start: 0.3, tag: 2)
        loadNibToView(view: windSpeedView, text: windSpeedTextField, color: .orange, start: 0.3, tag: 3)
    }
    
    private func loadNibToView(view itemView: UIView, text uiTextField: UITextField, color minColor: UIColor, start startValue: Float, tag viewTag: Int) {
        guard let nib = Bundle.main.loadNibNamed("SliderItem", owner: self, options: nil)?[0] as? SliderItem else { return }

        // Event change size with current bounds. - Understanding it is.
        nib.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        nib.setting(color: minColor, start: startValue)
        nib.tag = viewTag
        nib.delegate = self
        uiTextField.text = nib.getCurrentPercent()

        itemView.addSubview(nib)
    }
    
    @IBAction func temperatureEndEdit(_ sender: UITextField) {
    }
}

/**
 * Get Delegate events handle.
 */
extension AdvanceSliderViewController: SliderItemDelegate {
    func getValueChange(view: SliderItem, value: String) {
        switch view.tag {
        case 1:
            temperatureTextField.text = value
        case 2:
            humidityTextField.text = value
        default:
            windSpeedTextField.text = value
        }
        
    }
}
