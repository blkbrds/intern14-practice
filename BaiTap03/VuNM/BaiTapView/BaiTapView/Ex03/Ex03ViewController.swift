//
//  Ex03ViewController.swift
//  BaiTapView
//
//  Created by PCI0007 on 6/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex03: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = CGRect(x: 0, y: 0, width: 400, height: 800)
        view.addSubview(sliderView(a, 50))
    }
    
    func sliderView(_ frame: CGRect, _ numer: CGFloat) -> UIView {
        let bigBoard = UIView(frame: frame)
        bigBoard.backgroundColor = .clear
        let color = UIColor.black
        let board = UIView(frame: frame)
        board.backgroundColor = .white
        let remainRecView = UIView(frame: CGRect(x: 175, y: 100, width: 50, height: 600))
        remainRecView.backgroundColor = .gray
        remainRecView.layer.borderColor = color.cgColor
        remainRecView.layer.borderWidth = 1
        board.addSubview(remainRecView)
        let rectangleView = UIView(frame: CGRect(x: 175, y: 100, width: 50, height: 600 - ((100 - numer) * 6)))
        rectangleView.layer.borderWidth = 1
        rectangleView.layer.borderColor = color.cgColor
        rectangleView.backgroundColor = .red
        board.addSubview(rectangleView)
        let sliderButton = UIButton(frame: CGRect(x: 170, y: ((numer * 6) + 75), width: 60, height: 60))
        sliderButton.backgroundColor = .yellow
        sliderButton.layer.borderWidth = 1
        sliderButton.layer.borderColor = color.cgColor
        sliderButton.layer.cornerRadius = sliderButton.bounds.width * 0.5
        sliderButton.setTitle("\(Int(numer))", for: .normal)
        sliderButton.setTitleColor(.black, for: .normal)
        board.addSubview(sliderButton)
        bigBoard.addSubview(board)
        return board
    }
}
