//
//  FruitsViewController.swift
//  Fruits
//
//  Created by MBA0051 on 9/26/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class FruitsViewController: UIViewController {

    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var gradeButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var incrementAllButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bananaButton.titleLabel?.numberOfLines = 0
        bananaButton.titleLabel?.lineBreakMode = .byWordWrapping
        bananaButton.setTitle("Chuối\n0", for: .normal)
        bananaButton.titleLabel?.textAlignment = .center
        
        gradeButton.titleLabel?.numberOfLines = 0
        gradeButton.titleLabel?.lineBreakMode = .byWordWrapping
        gradeButton.setTitle("Nho\n0", for: .normal)
        gradeButton.titleLabel?.textAlignment = .center
        
        appleButton.titleLabel?.numberOfLines = 0
        appleButton.titleLabel?.lineBreakMode = .byWordWrapping
        appleButton.setTitle("Táo\n0", for: .normal)
        appleButton.titleLabel?.textAlignment = .center
    }

    @IBAction func incrementQuantity(_ sender: UIButton) {
        switch sender.currentTitle {
        case "+1 All":
            changeValue(bananaButton)
            changeValue(gradeButton)
            changeValue(appleButton)
        default:
            changeValue(sender)
        }
    }

    private func changeValue(_ fruitIncrement: UIButton) {
        let subArray = fruitIncrement.currentTitle?.lines
        fruitIncrement.setTitle(subArray![0] + "\n" + String(Int(subArray![1])! + 1), for: .normal)
    }
}

extension String {
    var lines: [String] {
        return split { String($0).rangeOfCharacter(from: .newlines) != nil }.map(String.init)
    }
}
