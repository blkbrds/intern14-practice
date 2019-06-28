//
//  ViewController.swift
//  BaiTap4
//
//  Created by Nguyen Duong on 6/25/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var buttonList: [NameButton] = [
        NameButton("1"),
        NameButton("2"),
        NameButton("3"),
        NameButton("+"),
        NameButton("4"),
        NameButton("5"),
        NameButton("6"),
        NameButton("-"),
        NameButton("7"),
        NameButton("8"),
        NameButton("9"),
        NameButton("x"),
        NameButton("AC"),
        NameButton("0"),
        NameButton("="),
        NameButton("/"),
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let frameFirst = CGRect(x: 25, y: 50, width: UIScreen.main.bounds.width - 90, height: 65)
        view.addSubview(resultView(frameFirst))
        output()
    }
    
    func addButtonView(_ frame: CGRect, _ nameButton: String) -> UIView {
        let containerView = UIView(frame: frame)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        button.setTitle(nameButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 254 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        containerView.addSubview(button)
        
        switch button.titleLabel?.text {
        case "AC":
            button.backgroundColor = .orange
        case "=":
            button.backgroundColor = .green
        case "+":
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        case "-":
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        case "x":
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        case "/":
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        default:
            button.backgroundColor = UIColor(red: 10 / 255.0, green: 10 / 255.0, blue: 97 / 255.0, alpha: 1)
        }
        
        return containerView
    }
    
    func output() {
        var x: CGFloat = 25
        var y: CGFloat = 125
        for index in 0..<buttonList.count {
            let frame = CGRect(x: x, y: y, width: 10, height: 65)
            let buttonView = addButtonView(frame, buttonList[index].nameButton)
            view.addSubview(buttonView)
            x += 86
            if x >= UIScreen.main.bounds.width - 50 {
                x = 25
                y += 90
            }
        }
    }
    
    func resultView(_ frame: CGRect) -> UIView {
        let containerView = UIView(frame: frame)
        containerView.frame = frame
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 254 / 255.0, alpha: 1).cgColor
        
        let frameResultView = CGRect(x: 0, y: 0, width: containerView.bounds.width - 20, height: containerView.bounds.height)
        let resultView = UILabel(frame: frameResultView)
        resultView.backgroundColor = .black
        resultView.text = "0"
        resultView.font = UIFont.systemFont(ofSize: 60.0)
        resultView.textAlignment = .right
        resultView.textColor = .black
        resultView.backgroundColor = .white
        containerView.addSubview(resultView)
        return containerView
    }
}
