//
//  BaiTap3ViewController.swift
//  btView1
//
//  Created by PCI0010 on 7/22/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: UIScreen.main.bounds.width / 2 - 10, y:  UIScreen.main.bounds.height / 2 - 100, width: 20, height: 200)
        view.addSubview(slider(frame: frame, number: 50))
    }
    func slider(frame: CGRect, number: CGFloat) -> UIView {
        let mainView = UIView(frame: frame)
        mainView.backgroundColor = .clear
        
        let column = UIView(frame: CGRect(x: 0, y: -0, width: 18, height: frame.height / 2))
        column.backgroundColor = .white
        column.layer.borderWidth = 2
        mainView.addSubview(column)
        
        let slideColor = UIView(frame: CGRect(x: 0, y: frame.height / 2, width: 18, height: frame.height / 2))
        slideColor.backgroundColor = .blue
        slideColor.layer.borderWidth = 2
        mainView.addSubview(slideColor)
        
        let iButton = UIButton(frame: CGRect(x: -10, y: frame.height / 2 - 15 , width: 35, height: 35))
        iButton.backgroundColor = .orange
        iButton.layer.cornerRadius = iButton.bounds.width * 0.4655
        iButton.layer.borderWidth = 0
        iButton.setTitle("50", for: .normal)
        iButton.setTitleColor(.white, for: .normal)
        iButton.titleLabel?.textAlignment = .center
        mainView.addSubview(iButton)
        
        
        return mainView }
    
}
