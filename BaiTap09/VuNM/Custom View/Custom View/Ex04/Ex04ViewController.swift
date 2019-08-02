//
//  Ex04ViewController.swift
//  Custom View
//
//  Created by PCI0007 on 7/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var boardLabel: UIImageView!
    @IBOutlet var adjustPositionButton: [UIButton]!
    
    var badgeNumber = UILabel()
    var point = CGPoint(x: -7.5, y: -10)
    var size = CGSize(width: 15, height: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTextField.delegate = self
        boardLabel.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
    }
    
    func adjustSizeOfBadge(size: CGSize, point: CGPoint) {
        badgeNumber.removeFromSuperview()
        badgeNumber = UILabel(frame: CGRect(origin: point, size: size))
        badgeNumber.layer.borderWidth = 1
        badgeNumber.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        badgeNumber.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        badgeNumber.clipsToBounds = true
        badgeNumber.textColor = .white
        badgeNumber.layer.cornerRadius = 8
        badgeNumber.textAlignment = .center
        badgeNumber.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        badgeNumber.text = valueTextField.text
        let intValue = Int(valueTextField.text ?? "0")
        guard let value = intValue else { return }
        if intValue == 0 {
            badgeNumber.removeFromSuperview()
        } else if value <= 9 {
            self.size = CGSize(width: 15, height: 20)
        } else if value >= 10 && value <= 99 {
            self.size = CGSize(width: 30, height: 20)
            badgeNumber.text = valueTextField.text
        } else {
            self.size = CGSize(width: 40, height: 20)
            badgeNumber.text = "99+"
        }
        boardLabel.addSubview(badgeNumber)
    }
    
    @IBAction func adjustPositionTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            point = CGPoint(x: -7.5, y: -10)
            adjustSizeOfBadge(size: size, point: point)
        } else if sender.tag == 1 {
            point = CGPoint(x: boardLabel.bounds.width / 2 - 7.5, y: -10)
            adjustSizeOfBadge(size: size, point: point)
        } else if sender.tag == 2 {
            adjustSizeOfBadge(size: size, point: CGPoint(x: boardLabel.bounds.width - 7.5, y: -10))
        } else if sender.tag == 3 {
            adjustSizeOfBadge(size: size, point: CGPoint(x: -badgeNumber.bounds.width / 2, y: boardLabel.bounds.height / 2 - badgeNumber.bounds.height / 2))
        } else if sender.tag == 4 {
            adjustSizeOfBadge(size: size, point: CGPoint(x: -badgeNumber.bounds.width / 2, y: boardLabel.bounds.height - badgeNumber.bounds.height / 2))
        } else if sender.tag == 5 {
            point = CGPoint(x: boardLabel.bounds.width / 2 - badgeNumber.bounds.width / 2, y: boardLabel.bounds.height - badgeNumber.bounds.height / 2)
            adjustSizeOfBadge(size: size, point: point)
        } else if sender.tag == 6 {
            point = CGPoint(x: boardLabel.bounds.width - badgeNumber.bounds.width / 2, y: boardLabel.bounds.height - badgeNumber.bounds.height / 2)
            adjustSizeOfBadge(size: size, point: point)
        } else if sender.tag == 7 {
            point = CGPoint(x: boardLabel.bounds.width - badgeNumber.bounds.width / 2, y: boardLabel.bounds.height / 2 - badgeNumber.bounds.height / 2)
            adjustSizeOfBadge(size: size, point: point)
        }
    }
}

extension Ex04ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let intValue = Int(valueTextField.text ?? "0")
        guard let value = intValue else { return true }
        if intValue == 0 {
            badgeNumber.removeFromSuperview()
        } else if value <= 9 {
            badgeNumber.removeFromSuperview()
            size = CGSize(width: 15, height: 20)
            adjustSizeOfBadge(size: size, point: point)
            
        } else if value >= 10 && value <= 99 {
            badgeNumber.removeFromSuperview()
            size = CGSize(width: 30, height: 20)
            adjustSizeOfBadge(size: size, point: point)
            badgeNumber.text = valueTextField.text
        } else {
            badgeNumber.removeFromSuperview()
            size = CGSize(width: 40, height: 20)
            adjustSizeOfBadge(size: size, point: point)
            badgeNumber.text = "99+"
        }
        return true
    }
}
