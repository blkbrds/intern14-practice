//
//  ViewController.swift
//  AutoLayoutBasic
//
//  Created by PCI0008 on 8/1/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var baiTapButton: [UIButton]!
    let vc: [UIViewController] = [Bai12ViewController(), Bai1Part2ViewController(), Bai2ViewController(), Bai2Part2VC(), Bai3ViewController(), Bai3Part2ViewController(), Bai3Part3ViewController(), Bai4ViewController(),Bai4Part1VC(), Bai4Part2VC(), Bai4Part3VC(), Bai4Part4VC()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        config()
    }
    
    func config() {
        title = "AutoLayout Exercise"
        navigationController?.navigationBar.barTintColor = UIColor(red: 53 / 255, green: 97 / 255, blue: 55 / 255, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        for button in baiTapButton {
            button.layer.cornerRadius = 5
        }
    }
    
    @IBAction private func baiTapTouchUpInside(_ sender: UIButton) {
        navigationController?.pushViewController(vc[sender.tag], animated: true)
    }
}
