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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
