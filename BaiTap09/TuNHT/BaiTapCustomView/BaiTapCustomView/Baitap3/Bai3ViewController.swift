//
//  Bai3ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    enum SliderTag: Int {
        case dog
        case cat
        case bird
    }
    
    @IBOutlet weak var dogValueTextField: UITextField!
    @IBOutlet weak var catValueTextField: UITextField!
    @IBOutlet weak var birdValueTextField: UITextField!
    private var dogSlider: MySliderView?
    private var catSlider: MySliderView?
    private var birdSlider: MySliderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogValueTextField.delegate = self
        catValueTextField.delegate = self
        birdValueTextField.delegate = self
        
        dogSlider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        dogSlider?.frame = CGRect(x: 50, y: 300, width: 350, height: 130)
        dogSlider?.tags = 0
        dogSlider?.delegate = self
        dogSlider?.dataSource = self
        view.addSubview(dogSlider!)
        
        catSlider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        catSlider?.frame = CGRect(x: 50, y: 460, width: 350, height: 130)
        catSlider?.buttonImageView.image = UIImage(named: "cat")
        catSlider?.tintSliderView.backgroundColor = .yellow
        catSlider?.tags = 1
        catSlider?.delegate = self
        catSlider?.dataSource = self
        view.addSubview(catSlider!)
        
        birdSlider = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?.first as? MySliderView
        birdSlider?.frame = CGRect(x: 50, y: 620, width: 350, height: 130)
        birdSlider?.buttonImageView.image = UIImage(named: "bird")
        birdSlider?.tintSliderView.backgroundColor = .red
        birdSlider?.tags = 2
        birdSlider?.delegate = self
        birdSlider?.dataSource = self
        view.addSubview(birdSlider!)
        
        updateValueTextField()
    }
    
    func updateValueTextField() {
        let dogValueX = dogSlider?.buttonImageView.center.x
        let dogLocation = dogValueX! * 100 / (dogSlider?.sliderView.bounds.width)!
        dogValueTextField.text = "\(Int(dogLocation))"
        
        let catValueX = catSlider?.buttonImageView.center.x
        let catLocation = catValueX! * 100 / (catSlider?.sliderView.bounds.width)!
        catValueTextField.text = "\(Int(catLocation))"
        
        let birdValueX = birdSlider?.buttonImageView.center.x
        let birdLocation = birdValueX! * 100 / (birdSlider?.sliderView.bounds.width)!
        birdValueTextField.text = "\(Int(birdLocation))"
    }
}

extension Bai3ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == dogValueTextField.text {
            catValueTextField.becomeFirstResponder()
        } else if textField.text == catValueTextField.text {
            birdValueTextField.becomeFirstResponder()
        } else if textField.text == birdValueTextField.text {
            dogSlider?.updateSlider()
            catSlider?.updateSlider()
            birdSlider?.updateSlider()
        }
        return true
    }
}

extension Bai3ViewController: MySliderViewDelegate {
    func updateValue() {
        updateValueTextField()
    }
}

extension Bai3ViewController: MySliderViewDataSource {
    func getValue(_ view: MySliderView) -> Int {
        guard let sliderTag: SliderTag = SliderTag(rawValue: view.tags) else { return 0 }
        switch sliderTag {
        case .dog:
            guard let text = dogValueTextField.text, let value = Int(text) else { return 0 }
            return value
        case .cat:
            guard let text = catValueTextField.text, let value = Int(text) else { return 0 }
            return value
        case .bird:
            guard let text = birdValueTextField.text, let value = Int(text) else { return 0 }
            return value
        }
    }
}
