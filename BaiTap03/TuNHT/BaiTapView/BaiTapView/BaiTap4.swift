//
//  BaiTap4.swift
//  BaiTapView
//
//  Created by PCI0001 on 6/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap4: UIViewController {
    private var signs = ["1", "2", "3", "+", "4", "5", "6", "-", "7", "8", "9", "X", "AC", "0", "=", "/"]
    let container = UIView(frame: CGRect(x: 30, y: 200, width: 400, height: 500))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 45, y: 100, width: 350, height: 50))
        label.backgroundColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        label.layer.borderWidth = 1
        view.addSubview(label)
        coordinates()
    }
    
    func addViewNumber(frame: CGRect, sign: String ) {
        let button = UIButton(frame: frame)
        button.backgroundColor = .blue
        button.setTitle(sign, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        container.addSubview(button)
    }
    
    func addViewOperation(frame: CGRect, sign: String ) {
        let button = UIButton(frame: frame)
        button.backgroundColor = .white
        button.setTitle(sign, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        container.addSubview(button)
    }
    
    func addViewAC(frame: CGRect, sign: String ) {
        let button = UIButton(frame: frame)
        button.backgroundColor = .orange
        button.setTitle(sign, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        container.addSubview(button)
    }
    
    func addViewEqual(frame: CGRect, sign: String ) {
        let button = UIButton(frame: frame)
        button.backgroundColor = .green
        button.setTitle(sign, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        container.addSubview(button)
    }
    
    func coordinates() {
        view.addSubview(container)
        var x: CGFloat = 15
        var y: CGFloat = 100
        let itemWidth: CGFloat = 50
        let itemHeight: CGFloat = 50
        
        for i in 0..<signs.count {
            let frame =  CGRect(x: x, y: y, width: itemWidth , height: itemHeight)
            if i == 3 || i == 7 || i == 11 || i == 15 {
                addViewOperation(frame: frame, sign: signs[i])
            } else if i == 12 {
                addViewAC(frame: frame, sign: signs[i])
            } else if i == 14 {
                addViewEqual(frame: frame, sign: signs[i])
            } else {
                addViewNumber(frame: frame, sign: signs[i])
            }
            
            let maxX: CGFloat = UIScreen.main.bounds.width
            let minX: CGFloat = 15
            x += 100
            if x >= maxX {
                x = minX
                y += 80
            }
        }
    }
}
