//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by MBA0051 on 9/26/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    struct  ButtonBackGroundColor {
        var value: String,
        backgroundColor: UIColor,
        borderColor: UIColor,
        characterColor: UIColor

        init(_ value: String, _ backgroundColor: UIColor, _ borderColor: UIColor,_ characterColor: UIColor) {
            self.value = value
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.characterColor = characterColor
        }
    }

    var calculateResult: UITextField = UITextField()
    var buttonArray: [ButtonBackGroundColor] = []
    let leftMargin = 40
    let topMargin = 125
    let w:Int = 50
    let h:Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateResult = UITextField(frame: CGRect(x: CGFloat(leftMargin), y: CGFloat(topMargin), width: UIScreen.main.bounds.width - 100, height: CGFloat(h * 2)))
        calculateResult.layer.borderColor = UIColor.blue.cgColor
        calculateResult.layer.borderWidth = 1
        calculateResult.text = "0"
        calculateResult.textAlignment = .right
        calculateResult.font = UIFont(name: calculateResult.font!.fontName, size: 40)
        calculateResult.textAlignment = .right
        view.addSubview(calculateResult)
        
        buttonArray = [ButtonBackGroundColor("1", .blue, UIColor.blue, UIColor.white),
                        ButtonBackGroundColor("2", .blue, .blue, .white),
                        ButtonBackGroundColor("3", .blue, .blue, .white),
                        ButtonBackGroundColor("+", .white, .blue, .black),
                        ButtonBackGroundColor("4", .blue, .blue, .white),
                        ButtonBackGroundColor("5", .blue, .blue, .white),
                        ButtonBackGroundColor("6", .blue, .blue, .white),
                        ButtonBackGroundColor("-", .white, .blue, .black),
                        ButtonBackGroundColor("7", .blue, .blue, .white),
                        ButtonBackGroundColor("8", .blue, .blue, .white),
                        ButtonBackGroundColor("9", .blue, .blue, .white),
                        ButtonBackGroundColor("x", .white, .blue, .black),
                        ButtonBackGroundColor("AC", .blue, .orange, .white),
                        ButtonBackGroundColor("0", .blue, .blue, .white),
                        ButtonBackGroundColor("=", .blue, .blue, .white),
                        ButtonBackGroundColor("/", .white, .blue, .black)
                    ]

        let imageNumber = 16
        var x:Int = leftMargin
        var y:Int = topMargin * 2
        
        let maxHeight = Int(UIScreen.main.bounds.size.height)
        let maxWidth = Int(UIScreen.main.bounds.size.width)
        // Calculate to display.
        for avatarNo in 0..<imageNumber {
            // display
            addComponent(x: x, y: y, w: w, h: h, button: buttonArray[avatarNo])
            
            // Move to new point.
            x += w + leftMargin
            if (x + w > maxWidth) {
                x = leftMargin
                y += topMargin
            }
            if (y > maxHeight - topMargin + leftMargin) {
                break
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    func addComponent(x xPoint: Int, y yPoint: Int, w width: Int, h height: Int,
                      button: ButtonBackGroundColor) {
        // Add button.
        let btnClick = UIButton(frame: CGRect(x: xPoint, y: yPoint, width: width, height: 3 * height / 2))
        btnClick.backgroundColor = button.backgroundColor
        btnClick.layer.borderColor = button.borderColor.cgColor
        btnClick.layer.borderWidth = 1
        btnClick.setTitle(button.value, for: .normal)
        btnClick.setTitleColor(button.characterColor, for: .normal)

        // Add event - call to buttonDidClick()
        btnClick.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(btnClick)
    }
    
    /**
     * Event listening when button has clicked.
     */
    @objc func buttonDidClick(_ sender: UIButton) {

        switch sender.currentTitle {
        case "AC":
            calculateResult.text = "0"
            break
        case "+", "-", "x", "/":
            calculateResult.text! += " " + sender.currentTitle! + " "
            break
        default:
            if (calculateResult.text! == "0") {
                calculateResult.text! = ""
            }
            calculateResult.text! += sender.currentTitle!
        }
        
        print("text : \(calculateResult.text!)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
