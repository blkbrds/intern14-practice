//
//  Ex03ViewController.swift
//  BaiTapVIew
//
//  Created by MBA0217 on 8/13/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex03ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 180, y: 250, width: 40, height: 300)
        let container = sliderView(frame: frame, number: 65)
        view.addSubview(container)
    }
    
    func sliderView (frame: CGRect, number: Double) -> UIView{
        let container = UIView(frame: frame)
        container.backgroundColor = .white
        
        
        // Add blue view
        let blueView = UIView(frame: CGRect(x: 10, y: 0, width: 25, height: 300))
        blueView.layer.borderWidth = 1
        blueView.layer.borderColor = UIColor(red: 0, green: 89 / 255, blue: 153 / 255, alpha: 1.0).cgColor
        blueView.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        
        container.addSubview(blueView)

        // Add white view
        let heightBlueView = Double(blueView.bounds.height) - (Double(container.bounds.height) * number / 100)
        
        let whiteView = UIView(frame: CGRect(x: 10, y: 0, width: 25, height: heightBlueView
        ))
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor(red: 0, green: 89 / 255, blue: 153 / 255, alpha: 1.0).cgColor
        whiteView.backgroundColor = .white
        
        container.addSubview(whiteView)
       
        // Add button
        let position = ((100 - number) * Double(blueView.bounds.height) / 100) - 5
        print(position, number, whiteView.bounds.height)
        let positionButton = UIButton(frame: CGRect(x: 0, y: position, width: 50, height: 50))
        positionButton.layer.borderWidth = 2
        positionButton.layer.borderColor = UIColor(red: 165 / 255, green: 102 / 255, blue: 0.0, alpha: 1.0).cgColor
        positionButton.backgroundColor = UIColor(red: 1.0, green: 145 / 255, blue: 0.0, alpha: 1.0)
        positionButton.setTitle("\(Int(number))", for: .normal)
        positionButton.layer.cornerRadius = positionButton.bounds.width / 2
        
        container.addSubview(positionButton)
        
        return container
    }
    
    

}
