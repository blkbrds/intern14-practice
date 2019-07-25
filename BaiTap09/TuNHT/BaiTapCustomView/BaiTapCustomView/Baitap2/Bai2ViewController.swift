//
//  Bai2ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/23/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {
    @IBOutlet weak var valueTextField: UITextField!
    private var mySlider: MySliderView?

    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.delegate = self
        
        mySlider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        mySlider?.frame = CGRect(x: 40, y: 250, width: 350, height: 160)
        mySlider?.delegate = self
        mySlider?.dataSource = self
        updateValueTextField()
        view.addSubview(mySlider!)
    }
    
    func updateValueTextField() {
        let currentX = mySlider?.buttonImageView.center.x
        let located = currentX! * 100 / (mySlider?.sliderView.bounds.width)!
        valueTextField.text = "\(Int(located))"
    }
}

extension Bai2ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mySlider?.updateSlider()
        return true
    }
}

extension Bai2ViewController: MySliderViewDelegate {
    func updateValue() {
        updateValueTextField()
    }
}

extension Bai2ViewController: MySliderViewDataSource {
    func getValue(_ view: MySliderView) -> Int {
        guard let text = valueTextField.text, let value = Int(text) else { return 0 }
        return value
    }
}
