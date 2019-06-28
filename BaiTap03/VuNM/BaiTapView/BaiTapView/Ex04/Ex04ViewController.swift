//
//  Ex04ViewController.swift
//  BaiTapView
//
//  Created by PCI0007 on 6/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class NameButton {
    var name: String
    init(_ name: String) {
        self.name = name
    }
}
class Ex04: UIViewController {
    let buttons: [NameButton] = [NameButton("1"), NameButton("2"), NameButton("3"), NameButton("+"), NameButton("4"), NameButton("5"), NameButton("6"), NameButton("-"), NameButton("7"), NameButton("8"), NameButton("9"), NameButton("X"), NameButton("AC"), NameButton("0"), NameButton("="), NameButton("/")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(addButtons(a))
    }
    
    private func addButtons(_ frame: CGRect) -> UIView {
        let board1 = UIView(frame: frame)
        var x: CGFloat = 10
        var y: CGFloat = 300
        for i in 0..<buttons.count {
            let button = UIButton(frame: CGRect(x: x, y: y, width: 90, height: 90))
            button.setTitle(buttons[i].name, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .orange
            button.titleLabel?.font = UIFont.systemFont(ofSize: 50.0)
            board1.addSubview(button)
            x += 100
            if x >= UIScreen.main.bounds.width - 20 {
                x = 10
                y += 120
            }
        }
        let resultLabel = UILabel(frame: CGRect(x: 15, y: 100, width: board1.bounds.width , height: 100))
        resultLabel.text = "0"
        resultLabel.textAlignment = .right
        resultLabel.backgroundColor = .white
        resultLabel.textColor = .black
        resultLabel.layer.borderWidth = 1
        let black = UIColor.black
        resultLabel.layer.borderColor = black.cgColor
        resultLabel.font = UIFont.systemFont(ofSize: 60.0)
        board1.addSubview(resultLabel)
        return board1
    }
}

