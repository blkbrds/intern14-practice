//
//  Ex03ViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 7/25/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {
    
    enum SliderTag: Int {
        case vu
        case tuanAnh
        case tu
    }

    @IBOutlet weak var vuTextField: UITextField!
    @IBOutlet weak var tuanAnhTextField: UITextField!
    @IBOutlet weak var tuTextField: UITextField!
    
    private var vuView: MySliderView?
    private var tuanAnhView: MySliderView?
    private var tuView: MySliderView?
    var percent: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vuView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        vuView?.frame = CGRect(x: -5, y: 290, width: 430, height: 200)
        vuView?.delegate = self
        vuView?.dataSource = self
        vuView?.vuButtonImageView.image = UIImage(imageLiteralResourceName: "vu")
        vuView?.emptyRectView.layer.cornerRadius = 10
        vuView?.rectView.layer.cornerRadius = 10
        vuView?.tag = 0
        view.addSubview(vuView!)
        
        tuanAnhView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        tuanAnhView?.frame = CGRect(x: -5, y: 490, width: 430, height: 200)
        tuanAnhView?.delegate = self
        tuanAnhView?.dataSource = self
        tuanAnhView?.rectView.backgroundColor = .red
        tuanAnhView?.vuButtonImageView.image = UIImage(imageLiteralResourceName: "tuananh")
        tuanAnhView?.emptyRectView.layer.cornerRadius = 10
        tuanAnhView?.rectView.layer.cornerRadius = 10
        tuanAnhView?.tag = 1
        view.addSubview(tuanAnhView!)
        
        tuView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView
        tuView?.frame = CGRect(x: -5, y: 690, width: 430, height: 200)
        tuView?.delegate = self
        tuView?.dataSource = self
        tuView?.rectView.backgroundColor = .blue
        tuView?.vuButtonImageView.image = UIImage(imageLiteralResourceName: "tudu")
        tuView?.emptyRectView.layer.cornerRadius = 10
        tuView?.rectView.layer.cornerRadius = 10
        tuView?.tag = 2
        view.addSubview(tuView!)
    }
}
extension Ex03ViewController: MySliderViewDelegate {
    func mySlider(_ mySlider: MySliderView, value: Int) {
        guard let sliderTag: SliderTag = SliderTag(rawValue: mySlider.tag) else { return }
        switch sliderTag {
        case .vu:
            vuTextField.text = String(value)
        case .tuanAnh:
            tuanAnhTextField.text = String(value)
        case .tu:
            tuTextField.text = String(value)
        }
    }
}

extension Ex03ViewController: MySliderViewDataSource {
    func getPercent(_ mySlider: MySliderView) -> Int {
        guard let sliderTag: SliderTag = SliderTag(rawValue: mySlider.tag) else { return 0 }
        switch sliderTag {
        case .vu:
            guard let text = vuTextField.text,
                let percent = Int(text) else { return 0 }
            return percent
        
        case .tuanAnh:
            guard let text = tuanAnhTextField.text,
                let percent = Int(text) else { return 0 }
            return percent
        case .tu:
            guard let text = tuTextField.text,
                let percent = Int(text) else { return 0 }
            return percent
        }
    }
}

extension Ex03ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == vuTextField {
            tuanAnhTextField.becomeFirstResponder()
            vuView?.updateSlider()
        } else if textField == tuanAnhTextField {
            tuTextField.becomeFirstResponder()
            tuanAnhView?.updateSlider()
        } else if textField == tuTextField {
            tuView?.updateSlider()
        }
    return true 
    }
}
