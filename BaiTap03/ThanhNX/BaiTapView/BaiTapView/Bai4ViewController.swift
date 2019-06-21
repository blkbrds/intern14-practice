//
//  Bai4ViewController.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/17/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Calculator {
    var cal: String
    init(cal: String) {
        self.cal = cal
    }
}

class Bai4ViewController: UIViewController {
    
    var cal: [Calculator] = [Calculator(cal: "1"),
                             Calculator(cal: "2"),
                             Calculator(cal: "3"),
                             Calculator(cal: "+"),
                             Calculator(cal: "4"),
                             Calculator(cal: "5"),
                             Calculator(cal: "6"),
                             Calculator(cal: "-"),
                             Calculator(cal: "7"),
                             Calculator(cal: "8"),
                             Calculator(cal: "9"),
                             Calculator(cal: "x"),
                             Calculator(cal: "AC"),
                             Calculator(cal: "0"),
                             Calculator(cal: "="),
                             Calculator(cal: "/")]

    override func viewDidLoad() {
        struct Config {
            static let calWidth: CGFloat = 70
            static let calHeight: CGFloat = 50
        }
        super.viewDidLoad()
        func prints() {
            var x: CGFloat = 70
            var y: CGFloat = 300
            for index in 0..<cal.count {
                let frame = CGRect(x: x, y: y, width: Config.calWidth, height: Config.calHeight)
                let containerView = calculatorView(frame: frame, cal: cal[index].cal)
                view.addSubview(containerView)
                
                x += 70
                if x >= UIScreen.main.bounds.width - Config.calWidth {
                    x = 70
                    y += 100
                }
            }
            let calView = calcuView(frame: CGRect(x: 70, y: 200, width: 260, height: 60))
            view.addSubview(calView)
        }
        
        _ = prints()
    }
    
    func calculatorView(frame: CGRect, cal: String) -> UIView {
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setTitle(cal, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1)
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        containerView.addSubview(button)
        button.layer.borderColor = UIColor(red: 48 / 255, green: 51 / 255, blue: 107 / 255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        if button.titleLabel?.text == "AC" {
            button.backgroundColor = .orange
        } else if button.titleLabel?.text == "=" {
            button.backgroundColor = UIColor(red: 106 / 255, green: 176 / 255, blue: 76 / 255, alpha: 1)
        } else if button.titleLabel?.text == "+"
            || button.titleLabel?.text == "-"
            || button.titleLabel?.text == "x"
            || button.titleLabel?.text == "/" {
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
        }
        
        return containerView
    }
    @objc func buttonDidClick() {
        print("Button is clicked !!!")
    }
    
    func calcuView(frame: CGRect) -> UIView {
        let calView = UIView(frame: frame)
        calView.backgroundColor = .clear
        calView.layer.borderColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1).cgColor
        calView.layer.borderWidth = 1
        
        let labelUILabel = UILabel(frame: CGRect(x: 1, y: 1, width: 250, height: 58))
        labelUILabel.text = "0"
        labelUILabel.font = UIFont.systemFont(ofSize: 40)
        labelUILabel.textColor = .black
        labelUILabel.textAlignment = .right
        labelUILabel.backgroundColor = .white
        calView.addSubview(labelUILabel)
        
        return calView
    }
}
