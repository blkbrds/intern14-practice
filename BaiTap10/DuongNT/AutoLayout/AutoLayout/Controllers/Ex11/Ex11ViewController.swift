//
//  Ex11ViewController.swift
//  AutoLayout
//
//  Created by Nguyen Duong on 8/7/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex11ViewController: BaseViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!

    @IBOutlet var redConstraints: [NSLayoutConstraint]!
    @IBOutlet var orangeConstraints: [NSLayoutConstraint]!
    @IBOutlet var greenConstraints: [NSLayoutConstraint]!
    @IBOutlet var blueConstraints: [NSLayoutConstraint]!
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
    }
    @IBAction func buttonActionTouchUpInside(_ button: UIButton) {
        switch button {
        case redButton:
            redConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 260)
            }
            orangeConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            greenConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            blueConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
        case orangeButton:
            redConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            orangeConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 260)
            }
            greenConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            blueConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
        case greenButton:
            redConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            orangeConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            greenConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 260)
            }
            blueConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
        case blueButton:
            redConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            orangeConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            greenConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 250)
            }
            blueConstraints.forEach { constraint in
                constraint.priority = UILayoutPriority(rawValue: 260)
            }
        default:
            break
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
