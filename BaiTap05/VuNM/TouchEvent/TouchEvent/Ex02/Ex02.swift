//
//  Ex02.swift
//  TouchEvent
//
//  Created by PCI0007 on 6/28/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex02: UIViewController {

    let board = UIView(frame: CGRect(origin: CGPoint(x: UIScreen.main.bounds.width / 2 - 30, y: 100), size: Config.sizeOfBoard))
    let sliderButton = UILabel(frame: CGRect(origin: CGPoint(x: 5, y: 0), size: Config.sizeOfButton))
    let remainRecView = UIView(frame: CGRect(origin: CGPoint(x: 10, y: 0), size: Config.sizeOfRemainRecView))
    let topRectangle = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: Config.sizeOfTopRecView))
    
    struct Config {
        static let sizeOfBoard: CGSize = CGSize(width: 60, height: UIScreen.main.bounds.height - 200)
        static let sizeOfRemainRecView: CGSize = CGSize(width: 40, height: UIScreen.main.bounds.height - 200)
        static let sizeOfTopRecView: CGSize = CGSize(width: 40, height: 25)
        static let sizeOfButton: CGSize = CGSize(width: 50, height: 50)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(board)
        adjustDetailOfView()
        topRectangle.backgroundColor = .blue
        remainRecView.addSubview(topRectangle)
    }

    func adjustDetailOfView() {
        let color = UIColor.black
        board.backgroundColor = .clear
        remainRecView.backgroundColor = .gray
        remainRecView.layer.borderColor = color.cgColor
        remainRecView.layer.borderWidth = 1
        board.addSubview(remainRecView)
        sliderButton.backgroundColor = .yellow
        sliderButton.layer.borderWidth = 1
        sliderButton.layer.borderColor = color.cgColor
        sliderButton.clipsToBounds = true
        sliderButton.layer.cornerRadius = sliderButton.bounds.width * 0.5
        sliderButton.isUserInteractionEnabled = true
        sliderButton.textAlignment = .center
        board.addSubview(sliderButton)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        if touch.view == sliderButton {
            let touchPoint = touch.location(in: board)
            if touchPoint.y >= 0 && touchPoint.y <= board.frame.size.height {
                sliderButton.center.y = touchPoint.y
                let temp = Int((board.frame.size.height - touchPoint.y ) * 100 / (board.frame.size.height))
                sliderButton.text = "\(temp)%"
                topRectangle.frame.size.height = sliderButton.center.y
            }
        }
        
//        if let touch = touches.first {
//            let touchPoint = touch.location(in: board)
//            if sliderButton.frame.contains(touchPoint) && sliderButton.center.y <= board.bounds.maxY && sliderButton.center.y >= board.bounds.minY {
//                sliderButton.center.y = touchPoint.y
//                sliderButton.text = "\((board.bounds.maxY - touchPoint.y) * 100 / (board.bounds.height))"
//                print(touchPoint)
//                print(sliderButton.center.y)
//            //setSliderValue(y!)
//            } else if sliderButton.center.y >= board.bounds.maxY {
//                sliderButton.center.y = board.bounds.maxY
//            } else if sliderButton.center.y <= board.bounds.minY {
//                sliderButton.center.y = board.bounds.minY
//            }
//
//        }
    }
}
