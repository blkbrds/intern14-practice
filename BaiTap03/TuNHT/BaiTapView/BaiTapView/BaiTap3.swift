//
//  BaiTap3.swift
//  BaiTapView
//
//  Created by PCI0001 on 6/21/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let x =  CGRect(x: 150, y: 150, width: UIScreen.main.bounds.width - 20, height: 300)
        view.addSubview(slider(x, 60))
    }
    
    func slider(_ frame: CGRect, _ number: CGFloat) -> UIView {
        let containerView = UIView(frame: frame)
        
        let columnView = UIView(frame: CGRect(x: 30, y: 50, width: 30, height: 400))
        columnView.layer.borderWidth = 1
        columnView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        columnView.backgroundColor = .blue
        containerView.addSubview(columnView)
        
        let located = number * columnView.bounds.height / 100
        
        let background = UILabel(frame: CGRect(x: 30, y: 50, width: 30, height: columnView.bounds.height - located))
        background.layer.borderWidth = 1
        background.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        background.backgroundColor = .white
        containerView.addSubview(background)
        
        let button = UIButton(frame: CGRect(x: columnView.bounds.width * 0.5, y: columnView.bounds.height - located, width: 60, height: 60))
        button.backgroundColor = .orange
        button.setTitle("\(Int(number))", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = button.bounds.width * 0.5
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        containerView.addSubview(button)
        
        return containerView
    }
}
