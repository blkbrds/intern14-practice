//
//  Ex04ViewController.swift
//  BaiTapVIew
//
//  Created by MBA0217 on 8/13/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

struct  ButtonBackGroundColor {
    var value: String,
    backGround: UIColor,
    borderColor: UIColor,
    characterColor: UIColor

    init(_ value: String, _ backGround: UIColor, _ borderColor: UIColor,_ characterColor: UIColor) {
        self.value = value
        self.backGround = backGround
        self.borderColor = borderColor
        self.characterColor = characterColor
    }
}

extension UIColor {
    static var blueColor: UIColor  { return UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0) }
    static var orangeColor: UIColor { return UIColor(red: 1.0, green: 145 / 255, blue: 0.0, alpha: 1.0) }
    static var greenColor: UIColor { return UIColor(red: 1 / 255, green: 115 / 255, blue: 1 / 255, alpha: 1.0) }
}

class Ex04ViewController: UIViewController {
    
    let buttonArray: [ButtonBackGroundColor] = [
        ButtonBackGroundColor("1", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("2", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("3", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("+", UIColor.white, UIColor.blue, UIColor.black),
        ButtonBackGroundColor("4", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("5", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("6", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("-", UIColor.white, UIColor.blue, UIColor.black),
        ButtonBackGroundColor("7", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("8", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("9", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("x", UIColor.white, UIColor.blue, UIColor.black),
        ButtonBackGroundColor("AC", UIColor.orangeColor, UIColor.orange, UIColor.white),
        ButtonBackGroundColor("0", UIColor.blueColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("=", UIColor.greenColor, UIColor.blue, UIColor.white),
        ButtonBackGroundColor("/", UIColor.white, UIColor.blue, UIColor.black),

    ]
    
    private let edge = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 30, y: 250, width: UIScreen.main.bounds.width - 55, height: 400)
        
        show(frame: frame)

        // Do any additional setup after loading the view.
    }
    

    func buttonCalculatorView (frame: CGRect, buttonColor: ButtonBackGroundColor) -> UIButton {
        
        let calculatorButton = UIButton(frame: frame)
        calculatorButton.backgroundColor = buttonColor.backGround
        calculatorButton.layer.borderColor = buttonColor.borderColor.cgColor
        calculatorButton.layer.borderWidth = 1
        calculatorButton.setTitle(buttonColor.value, for: .normal)
        calculatorButton.setTitleColor(buttonColor.characterColor, for: .normal)
        
        return calculatorButton
    }
    
    func screenComputeView(frame: CGRect) -> UIView {
        let screenView = UIView(frame: CGRect(x: 30, y: 120, width: UIScreen.main.bounds.width - 55, height: 70))
        
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 70))
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        textField.text = "0"
        textField.setRightPaddingPoints(10)
        textField.font = UIFont(name: textField.font!.fontName, size: 40)
        textField.textAlignment = .right
        
        screenView.addSubview(textField)
        
        return screenView
    }
    
    func show(frame: CGRect) {
        let screenView = screenComputeView(frame: frame)
        let buttonView = UIView(frame: frame)
        view.addSubview(screenView)

        var x = 0
        var y = 0
        for val in buttonArray {
            let buttonSubViewFrame = CGRect(x: x, y: y, width: edge, height: edge)
            let calculatorButton = buttonCalculatorView(frame: buttonSubViewFrame, buttonColor: val)
            buttonView.addSubview(calculatorButton)
            x += 100
            if x >= Int((buttonView.bounds.width)) {
                x = 0
                y += 100
            }
        }
        view.addSubview(buttonView)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
