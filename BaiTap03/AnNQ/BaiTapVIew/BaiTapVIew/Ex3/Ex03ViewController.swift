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
        let container = sliderView(frame, 70)
        view.addSubview(container)
    }
    
    func sliderView (_ frame: CGRect,_ number: Double) -> UIView{
        let container = UIView(frame: frame)
        container.backgroundColor = .white
        
        
        // Add blue part
        let bluePart = UIView(frame: CGRect(x: 10, y: 0, width: 25, height: 300))
        bluePart.layer.borderWidth = 1
        bluePart.layer.borderColor = UIColor(red: 0, green: 89 / 255, blue: 153 / 255, alpha: 1.0).cgColor
        bluePart.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        
        container.addSubview(bluePart)

        // Add white part
        let heightBulePart = Double(bluePart.bounds.height) - (Double(container.bounds.height) * number / 100)
        print(heightBulePart)
        
        let whitePart = UIView(frame: CGRect(x: 10, y: 0, width: 25, height: heightBulePart
        ))
        whitePart.layer.borderWidth = 1
        whitePart.layer.borderColor = UIColor(red: 0, green: 89 / 255, blue: 153 / 255, alpha: 1.0).cgColor
        whitePart.backgroundColor = .white
        
        container.addSubview(whitePart)
       
        // Add button
        let btnPosition = ((100 - number) * Double(bluePart.bounds.height) / 100) - 5
        print(btnPosition, number, whitePart.bounds.height)
        let button = UIButton(frame: CGRect(x: 0, y: btnPosition, width: 50, height: 40))
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 165 / 255, green: 102 / 255, blue: 0.0, alpha: 1.0).cgColor
        button.backgroundColor = UIColor(red: 1.0, green: 145 / 255, blue: 0.0, alpha: 1.0)
        button.setTitle("\(Int(number))", for: .normal)
        button.layer.cornerRadius = 20
        
        container.addSubview(button)
        
        return container
    }
    
    

}
