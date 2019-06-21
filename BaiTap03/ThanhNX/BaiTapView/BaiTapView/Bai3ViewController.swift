//
//  Bai3ViewController.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/19/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai3ViewController: UIViewController {
    let x = (UIScreen.main.bounds.width / 2) - (Config.sliderWidth / 2)
    let y = (UIScreen.main.bounds.height / 2) - (Config.sliderHeight / 2)
    struct Config {
        static let sliderWidth: CGFloat = 60
        static let sliderHeight: CGFloat = 280
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let slideViews = sliderView(frame: CGRect(x: x, y: y, width: Config.sliderWidth, height: Config.sliderHeight), number: 30)
        view.addSubview(slideViews)
    }
    
    func sliderView(frame: CGRect, number: CGFloat) -> UIView {
        let viewBig = UIView(frame: frame)
        viewBig.backgroundColor = .clear
        
        let rectView = UIView(frame: CGRect(x: 14, y: 14, width: 32, height: 252))
        rectView.backgroundColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1)
        rectView.layer.borderColor = UIColor(red: 48 / 255, green: 51 / 255, blue: 107 / 255, alpha: 1).cgColor
        rectView.layer.borderWidth = 1
        viewBig.addSubview(rectView)
        
        let xNumber = rectView.bounds.height - number / 100 * rectView.bounds.height
        
        let backgroundSlideView = UILabel(frame: CGRect(x: 15, y: 15, width: 30, height: xNumber))
        backgroundSlideView.backgroundColor = .white
        viewBig.addSubview(backgroundSlideView)
        
        let slideViewButton = UIButton(frame: CGRect(x: 15, y: 15, width: 60, height: 50))
        slideViewButton.backgroundColor = UIColor(red: 235 / 255, green: 135 / 255, blue: 60 / 255, alpha: 1)
        slideViewButton.layer.cornerRadius = slideViewButton.bounds.width / 2
        slideViewButton.center = CGPoint(x: viewBig.bounds.width / 2, y: xNumber)
        slideViewButton.setTitle("\(Int(number))", for: .normal)
        slideViewButton.setTitleColor(.white, for: .normal)
        slideViewButton.titleLabel?.textAlignment = .center
        print(number / 100 * rectView.bounds.height)
        slideViewButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        viewBig.addSubview(slideViewButton)
        
        return viewBig
    }
    
    @objc func buttonDidClick() {
        print("Button is clicked")
    }
}
