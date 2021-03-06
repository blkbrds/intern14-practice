//
//  Bai3ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/22/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai3ViewController: UIViewController {

    enum SliderTag: Int {
        case temperature
        case humidity
        case windPower
    }
    
    @IBOutlet private var weatherLabel: [UILabel]!
    @IBOutlet private weak var temperatureTextField: UITextField!
    @IBOutlet private weak var humidityTextField: UITextField!
    @IBOutlet private weak var windPowerTextField: UITextField!
    private var temperatureView: MySliderView?
    private var humidityView: MySliderView?
    private var windPowerView: MySliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bai 3"
        
        temperatureView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        temperatureView?.frame = CGRect(x: 30, y: 320, width: 353, height: 76)
        temperatureView?.index = 0
        view.addSubview(temperatureView!)
        temperatureView?.delegate = self
        temperatureView?.dataSource = self
        
        humidityView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        humidityView?.frame = CGRect(x: 30, y: 520, width: 353, height: 76)
        humidityView?.index = 1
        humidityView?.orangeView.backgroundColor = .purple
        view.addSubview(humidityView!)
        humidityView?.delegate = self
        humidityView?.dataSource = self
        
        windPowerView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        windPowerView?.frame = CGRect(x: 30, y: 720, width: 353, height: 76)
        windPowerView?.index = 2
        windPowerView?.orangeView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.addSubview(windPowerView!)
        windPowerView?.delegate = self
        windPowerView?.dataSource = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension Bai3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == temperatureTextField {
            humidityTextField.becomeFirstResponder()
        } else if textField == humidityTextField {
            windPowerTextField.becomeFirstResponder()
        } else if textField == windPowerTextField {
            temperatureView?.reloadDesign()
            humidityView?.reloadDesign()
            windPowerView?.reloadDesign()
        }
        return true
    }
}

extension Bai3ViewController: MySliderViewDelegate {
    func view(_ view: MySliderView, needPerformAction action: MySliderView.Action) {
        switch action {
        case .getPercent(let result):
            guard let sliderTag: SliderTag = SliderTag(rawValue: view.index) else { return }
            switch sliderTag {
            case .temperature:
                temperatureTextField.text = String(result)
            case .humidity:
                humidityTextField.text = String(result)
            case .windPower:
                windPowerTextField.text = String(result)
            }
        }
    }
}

extension Bai3ViewController: MySliderViewDataSource {
    func getPercent(_ view: MySliderView) -> Int {
        guard let sliderTag: SliderTag = SliderTag(rawValue: view.index) else { return 0 }
        switch sliderTag {
        case .temperature:
            guard let text = temperatureTextField.text,
                let number = Int(text) else { return 0 }
            return number
        case .humidity:
            guard let text = humidityTextField.text,
                let number = Int(text) else { return 0 }
            return number
        case .windPower:
            guard let text = windPowerTextField.text,
                let number = Int(text) else { return 0 }
            return number
        }
    }
}
