//
//  ViewController.swift
//  BaiTap3
//
//  Created by Nguyen Duong on 6/25/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let x =  CGRect(x: 150, y: 150, width: 100, height: 500)
        view.addSubview(sliderView(x, 70))
    }
    
    func sliderView(_ frame: CGRect, _ number: CGFloat) -> UIView {
        let containerView = UIView(frame: frame)
        
        let columnView = UIView(frame: CGRect(x: 25, y: 25, width: 100, height: 500))
        columnView.layer.borderWidth = 1
        columnView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        columnView.backgroundColor = .blue
        containerView.addSubview(columnView)
        
        let located = number * columnView.bounds.height / 100
        
        let backgroundSlideView = UILabel(frame: CGRect(x: 25, y: 25, width: 100, height: columnView.bounds.height - located))
        backgroundSlideView.layer.borderWidth = 1
        backgroundSlideView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        backgroundSlideView.backgroundColor = .white
        containerView.addSubview(backgroundSlideView)
        
        let button = UIButton(frame: CGRect(x: 0, y: columnView.bounds.height - located - 25, width: 150, height: 125))
        button.backgroundColor = .orange
        button.setTitle("\(Int(number))", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = button.bounds.width * 0.4655
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        containerView.addSubview(button)
        return containerView
    }
}
