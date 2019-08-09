//
//  Ex12Part2ViewController.swift
//  AutoLayout
//
//  Created by Nguyen Duong on 8/7/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex12Part2ViewController: BaseViewController {

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex12 - Part 2"
    }

    override func setupData() {
        super.setupData()
    }
}
// MARK: - IBDesignable
@IBDesignable extension UIButton {

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
