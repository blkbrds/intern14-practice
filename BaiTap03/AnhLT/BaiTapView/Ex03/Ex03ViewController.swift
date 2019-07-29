//
//  Ex03ViewController.swift
//  BaiTapView
//
//  Created by PCI0013 on 6/26/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame =  CGRect(x: 145, y: 100, width: 50, height: 300)
        view.addSubview(sliderView(frame, 40))
    }
    
    func sliderView(_ frame: CGRect,_ number: CGFloat) -> UIView {
        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .white
        
        let rectView = UIView(frame: CGRect(x: 10, y: 0, width: 30, height: 300))
        rectView.layer.borderWidth = 1
        rectView.layer.borderColor = UIColor(red: 255 / 255, green: 159 / 255, blue: 100 / 255, alpha: 1).cgColor
        rectView.layer.backgroundColor = UIColor(red: 100 / 255, green: 150 / 255, blue: 255 / 255, alpha: 1).cgColor
        containerView.addSubview(rectView)
        
        let located = number * rectView.bounds.height / 100
        
        let button = UIButton(frame: CGRect(x: 35, y: located, width: 50, height: 50))
        button.backgroundColor = .orange
        button.center = CGPoint(x: containerView.bounds.width * 0.5 , y:  rectView.bounds.height - located)
        button.setTitle("\(Int(number))", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = button.bounds.width * 0.5
        button.layer.borderColor = UIColor(red: 60 / 255, green: 200 / 255, blue: 100 / 255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        containerView.addSubview(button)
        
        let emptyRect = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: rectView.bounds.height - located))
        emptyRect.layer.borderWidth = 0
        emptyRect.backgroundColor = .white
        rectView.addSubview(emptyRect)
        
        return containerView
    }
}
