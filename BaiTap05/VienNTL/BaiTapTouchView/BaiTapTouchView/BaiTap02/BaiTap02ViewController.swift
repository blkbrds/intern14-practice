//
//  BaiTap02ViewController.swift
//  BaiTapTouchView
//
//  Created by Nguyen Truong Lam Vien on 6/28/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap02ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let x =  CGRect(x: UIScreen.main.bounds.width * 0.475, y: UIScreen.main.bounds.height * 0.25, width: 30, height: 300)
        view.addSubview(sliderView(x, 30))
    }
    
    func sliderView(_ frame: CGRect, _ number: CGFloat) -> UIView {
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .black
        
        let columnView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: frame.height))
        columnView.layer.borderWidth = 1
        columnView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        columnView.backgroundColor = UIColor(red: 235 / 255.0, green: 77 / 255.0, blue: 75 / 255.0, alpha: 1)
        containerView.addSubview(columnView)
        
        let located = frame.height * number / 100
        
        let backgroundSlideView = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: columnView.bounds.height - located))
        backgroundSlideView.layer.borderWidth = 1
        backgroundSlideView.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        backgroundSlideView.backgroundColor = .white
        containerView.addSubview(backgroundSlideView)
        
        let button = UIButton(frame: CGRect(x: containerView.bounds.origin.x - 10, y: frame.height - located, width: 50, height: 50))
        button.backgroundColor = .white
        button.setTitle("\(Int(number))", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = button.bounds.width * 0.5
        button.layer.borderColor = UIColor(red: 19 / 255.0, green: 15 / 255.0, blue: 64 / 255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
        containerView.addSubview(button)
        return containerView
    }

}
