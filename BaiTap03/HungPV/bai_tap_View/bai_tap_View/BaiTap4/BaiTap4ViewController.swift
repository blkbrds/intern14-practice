//
//  BaiTap4ViewController.swift
//  btView1
//
//  Created by PCI0010 on 7/23/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap4ViewController: UIViewController {
    var views = UIView()
    var buttonList : [NameButton] = [   NameButton(button:("1")),
                                        NameButton(button:("2")),
                                        NameButton(button:("3")),
                                        NameButton(button:("+")),
                                        NameButton(button:("4")),
                                        NameButton(button:("5")),
                                        NameButton(button:("6")),
                                        NameButton(button:("-")),
                                        NameButton(button:("7")),
                                        NameButton(button:("8")),
                                        NameButton(button:("9")),
                                        NameButton(button:("*")),
                                        NameButton(button:("AC")),
                                        NameButton(button:("0")),
                                        NameButton(button:("=")),
                                        NameButton(button:("/"))]
    
    var button = UIButton(frame: CGRect(x: 50, y: 100, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel()
        listBotton()
    }
    
    func calcView(frame: CGRect, index: Int) -> UIView {
        let mainView = UIView(frame: frame)
        mainView.backgroundColor = .clear
        
        button = UIButton(frame: CGRect(x: 50, y: 100, width: 50, height: 50))
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.setTitle(buttonList[index].nameButton, for: .normal)
        button.setTitleColor(.black, for: .normal)
        mainView.addSubview(button)
        
        
        switch button.titleLabel?.text {
        case "AC":
            button.backgroundColor = .orange
            
        case "=":
            button.backgroundColor = .green
            
        case "+":
            button.backgroundColor = .white
        case "-":
            button.backgroundColor = .white
        case "*":
            button.backgroundColor = .white
        case "/":
            button.backgroundColor = .white
        default:
            button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
        
        return mainView }
    
    func listBotton() {
        var x: CGFloat = 10
        var y: CGFloat = 150
        for index in 0..<buttonList.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 10
                y += 80
            }
            let frame =  CGRect(x: x, y: y, width: 50 , height: 50 )
            views = calcView(frame: frame, index: index)
            x += 80
            view.addSubview(views)
        }
    }
    
    func resultLabel() {
        let resultLabel = UILabel(frame: CGRect(x: 50, y: 150, width: 320, height: 50))
        resultLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        resultLabel.layer.borderWidth = 2
        resultLabel.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(resultLabel)
        
        let resultLabel1 = UILabel(frame: CGRect(x: 2, y: 2, width: 300, height: 48))
        resultLabel1.backgroundColor = .clear
        resultLabel1.text = "0 "
        resultLabel1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        resultLabel1.textAlignment = .right
        resultLabel.addSubview(resultLabel1)
    }
    
    
    
}
class NameButton {
    var nameButton:String = ""
    
    init(button: String) {
        self.nameButton = button
    }
}
