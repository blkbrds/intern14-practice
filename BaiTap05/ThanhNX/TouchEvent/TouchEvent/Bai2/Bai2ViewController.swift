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
    
    let viewBig = UIView(frame: CGRect(x: Config.xFrame, y: Config.yFrame, width: Config.sliderWidth, height: Config.sliderHeight))
    private let blueView = UIView(frame: CGRect(x: 14, y: 14, width: 32, height: 252))
    private let orangeSliderView = UIView(frame: CGRect(x: 15, y: 15, width: 50, height: 50))
    private let slideLabel = UILabel(frame: CGRect(x: 5, y: 15, width: 40, height: 20))
    private let whiteView = UIView(frame: CGRect(x: 15, y: 15, width: 30, height: 0))
    private var percentage: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = sliderView()
        
        view.addSubview(frame)
    }
    
    func sliderView() -> UIView {
        viewBig.backgroundColor = .clear
        
        blueView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        blueView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        blueView.layer.borderWidth = 1
        viewBig.addSubview(blueView)
        
        whiteView.backgroundColor = .white
        whiteView.frame.size.height = blueView.frame.size.height / 2
        viewBig.addSubview(whiteView)
        
        orangeSliderView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        orangeSliderView.layer.cornerRadius = orangeSliderView.bounds.width / 2
        orangeSliderView.center = CGPoint(x: viewBig.bounds.width / 2, y: blueView.frame.height / 2)
        viewBig.addSubview(orangeSliderView)
        
        slideLabel.text = "\(50)"
        slideLabel.textColor = .white
        slideLabel.textAlignment = .center
        orangeSliderView.addSubview(slideLabel)
        
        return viewBig
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == orangeSliderView {
                var touchLocation = touch.location(in: blueView)
                touchLocation.x = orangeSliderView.frame.origin.x
                touchLocation.y -= orangeSliderView.bounds.height / 2
                orangeSliderView.frame.origin = touchLocation
                if orangeSliderView.center.y >= blueView.bounds.size.height {
                    orangeSliderView.center.y = blueView.bounds.size.height
                    slideLabel.text = "\(0)"
                } else if orangeSliderView.center.y <= 14 {
                    orangeSliderView.center.y = 14
                    slideLabel.text = "\(100)"
                } else {
                    whiteView.frame.size.height = orangeSliderView.center.y
                    percentage = 100 - (whiteView.frame.size.height / blueView.bounds.height * 100)
                    slideLabel.text = "\(Int(percentage))"
                }
            }
        }
    }
}
