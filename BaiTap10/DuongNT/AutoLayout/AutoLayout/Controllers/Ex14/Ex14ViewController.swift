//
//  Ex14ViewController.swift
//  AutoLayout
//
//  Created by Nguyen Duong on 8/9/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex14ViewController: BaseViewController {

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
    }

    override func setupData() {
        super.setupData()
    }
}

// MARK: - IBDesignable
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: Double {
        get {
            return Double(layer.borderWidth)
        }
        set {
            layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
