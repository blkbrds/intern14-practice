//
//  SlideViewController.swift
//  CustomView
//
//  Created by MBA0217 on 9/24/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var sliderView: UIView!
    let mySliderView = Bundle.main.loadNibNamed("MySliderView", owner: self, options: nil)?[0] as? MySliderView

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.delegate = self
        configUI()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resultTextField.resignFirstResponder()
    }
    
    private func configUI() {
        resultTextField.layer.borderWidth = 1
        resultTextField.layer.borderColor = UIColor.black.cgColor
        resultTextField.layer.cornerRadius = 10
        
        sliderView.addSubview(mySliderView!)
        mySliderView?.delegate = self
    }
    
    @IBAction func changeTextFieldValue(_ sender: UITextField) {
        if var percent = Float(sender.text!) {
            if percent > 100 {
                percent = 100
            }
            UIView.animate(
                withDuration: 1.0,
                delay: 0.0,
                options: .curveEaseIn,
                animations: {
                    self.mySliderView?.changeSliderView(value: percent)

                },
                completion: { _ in
                }
            )
        }
    }
     
   
}

extension SlideViewController: UITextFieldDelegate, MySliderViewDelegate {
    func computePercentSlider(result: Int) {
        resultTextField.text = "\(result)"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}
