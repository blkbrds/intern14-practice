//
//  Ex04ViewController.swift
//  BaiTapView
//
//  Created by PCI0013 on 6/25/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit
class ButtonLabel {
    var buttonLabel: String = " "
    
    init(_ button: String) {
        buttonLabel = button
    }
}

class Ex04ViewController: UIViewController {
    
    let containerView = UIView()
    
    var buttonList: [ButtonLabel] = [ButtonLabel("1"), ButtonLabel("2"), ButtonLabel("3"), ButtonLabel("+"), ButtonLabel("4"), ButtonLabel("5"), ButtonLabel("6"), ButtonLabel("-"), ButtonLabel("7"), ButtonLabel("8"), ButtonLabel("9"), ButtonLabel("*"), ButtonLabel("AC"), ButtonLabel("0"), ButtonLabel("="), ButtonLabel(":")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 10, y: 50, width: 400, height: 500)
        configContainerView(frame)
        addButton()
    }
    
    func configContainerView(_ frame: CGRect) {
        containerView.frame = frame
        containerView.layer.borderWidth = 1
        containerView.backgroundColor = .white
        containerView.layer.borderColor = UIColor(red: 150 / 255, green: 150 / 255, blue: 255 / 255, alpha: 1).cgColor
        
        let rectView = CGRect(x: 20, y: 20, width: 360, height: 60)
        let rectangle = UILabel(frame: rectView)
        rectangle.layer.borderWidth = 1
        rectangle.layer.borderColor = UIColor.black.cgColor
        rectangle.text = "0"
        rectangle.textColor = .black
        rectangle.textAlignment = .right
        rectangle.font = UIFont.systemFont(ofSize: 60.0)
        containerView.addSubview(rectangle)
        view.addSubview(containerView)
    }

    func addButton() {
        var x: CGFloat = 20
        var y: CGFloat = 100

        for i in 0..<buttonList.count {
            let frame = CGRect(x: x, y: y, width: 65, height: 65)
            let button = UIButton(frame: frame)
            button.setTitle(buttonList[i].buttonLabel, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.textAlignment = .center
            button.layer.backgroundColor = UIColor(red: 150 / 255, green: 150 / 255, blue: 255 / 255, alpha: 1).cgColor
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(red: 100 / 255, green: 150 / 255, blue: 255 / 255, alpha: 1).cgColor
            containerView.addSubview(button)
            x += 100
            if x >= UIScreen.main.bounds.width - 50 {
                x = 20
                y += 100
            }
        }
    }
}
