//
//  Bai2ViewController.swift
//  TouchEvent
//
//  Created by PCI0008 on 6/28/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai2ViewController: UIViewController {
    struct Config {
        static let xFrame = UIScreen.main.bounds.width / 2 - Config.sliderWidth / 2
        static let yFrame = UIScreen.main.bounds.height / 2 - Config.sliderHeight / 2
        static let sliderWidth: CGFloat = 60
        static let sliderHeight: CGFloat = 280
    }
    
    let rectView = UIView(frame: CGRect(x: 14, y: 14, width: 32, height: 252))
    let slideView = UIButton(frame: CGRect(x: 15, y: 15, width: 50, height: 50))
    var num: CGFloat = 50
    var xNumber: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = sliderView(frame: CGRect(x: Config.xFrame, y: Config.yFrame, width: Config.sliderWidth, height: Config.sliderHeight), number: num)
        view.addSubview(frame)
    }
    
    func sliderView(frame: CGRect, number: CGFloat) -> UIView {
        let viewBig = UIView(frame: frame)
        viewBig.backgroundColor = .clear
        
        rectView.backgroundColor = UIColor(red: 116 / 255, green: 185 / 255, blue: 255 / 255, alpha: 1)
        rectView.layer.borderColor = UIColor(red: 48 / 255, green: 51 / 255, blue: 107 / 255, alpha: 1).cgColor
        rectView.layer.borderWidth = 1
        viewBig.addSubview(rectView)
        
        //num = rectView.bounds.height
        
        xNumber = rectView.bounds.height - number / 100 * rectView.bounds.height
        
        let backgroundSlideView = UILabel(frame: CGRect(x: 15, y: 15, width: 30, height: xNumber))
        backgroundSlideView.backgroundColor = .white
        viewBig.addSubview(backgroundSlideView)
        
        slideView.backgroundColor = UIColor(red: 235 / 255, green: 135 / 255, blue: 60 / 255, alpha: 1)
        slideView.layer.cornerRadius = slideView.bounds.width / 2
        slideView.center = CGPoint(x: viewBig.bounds.width / 2, y: xNumber)
        slideView.setTitle("\(Int(num))", for: .normal)
        slideView.setTitleColor(.white, for: .normal)
        slideView.titleLabel?.textAlignment = .center
        viewBig.addSubview(slideView)
        
        return viewBig
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            guard touch.view != slideView else { return }
            slideView.center = touch.location(in: rectView)
            num = slideView.center.y * rectView.bounds.height / 100
            
            print("\(slideView.center.x) \(slideView.center.y)")
        }
    }
}
