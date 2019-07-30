//
//  Ex02ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/23/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {
    @IBOutlet weak var settingValueTextField: UITextField!
    var percent: Int = 0
    private var mySlider: MySliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mySlider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        mySlider?.frame = CGRect(x: -5, y: 200, width: 430, height: 200)
        mySlider?.delegate = self
        mySlider?.dataSource = self
        view.addSubview(mySlider!)
        
        mySlider?.emptyRectView.layer.cornerRadius = 10
        mySlider?.rectView.layer.cornerRadius = 10
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        settingValueTextField.becomeFirstResponder()
    }
}

extension Ex02ViewController: MySliderViewDelegate {
    func mySlider(_ mySlider: MySliderView, value: Int) {
        settingValueTextField.text = String(value)
        print("\(value)")
    }
}

extension Ex02ViewController: MySliderViewDataSource {
    func getPercent(_ mySlider: MySliderView) -> Int {
        guard let text = settingValueTextField.text,
        let percent = Int(text) else { return 0 }
        return percent
    }
}

extension Ex02ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mySlider?.updateSlider()
        return true
    }
}

