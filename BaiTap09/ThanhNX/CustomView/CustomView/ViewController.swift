//
//  ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/18/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var buttonBaiTap: [UIButton]!
    let viewController: [UIViewController] = [Bai1ViewController(), Bai2ViewController(), Bai3ViewController(), Bai4ViewController(), Bai5ViewController(), Bai6ViewController()]
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
    }
    
    private func configNavi() {
        title = "CustomView Exercise"
        navigationController?.navigationBar.barTintColor = UIColor(red: 53 / 255, green: 97 / 255, blue: 55 / 255, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        for button in buttonBaiTap {
            button.layer.cornerRadius = 20            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonBaiTapTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(viewController[sender.tag], animated: true)
    }
}
