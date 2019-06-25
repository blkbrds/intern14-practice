//
//  BaiTap02ViewController.swift
//  BaiTapIBOutLetIBAction
//
//  Created by Nguyen Truong Lam Vien on 6/25/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap02ViewController: UIViewController {
    
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var bananaButton: UIButton!
    @IBOutlet private weak var bananaQuantityLabel: UILabel!
    @IBOutlet private weak var grapesLabel: UILabel!
    @IBOutlet private weak var bananaView: UIView!
    @IBOutlet private weak var grapesQuantityLabel: UILabel!
    @IBOutlet private weak var grapesButton: UIButton!
    @IBOutlet private weak var grapesView: UIView!
    @IBOutlet private weak var appleLabel: UILabel!
    @IBOutlet private weak var appleQuantityLabel: UILabel!
    @IBOutlet private weak var appleButton: UIButton!
    @IBOutlet private weak var addAllQuantityButton: UIButton!
    @IBOutlet private weak var appleView: UIView!
    
    var banana = 0
    var grapes = 0
    var apple = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bananaView.layer.cornerRadius = 8
        grapesView.layer.cornerRadius = 8
        appleView.layer.cornerRadius = 8
    }
    
    @IBAction private func bananaButtonTouchUpInside(_ sender: Any) {
        banana += 1
        bananaQuantityLabel.text = "\(banana)"
    }
    
    @IBAction func grapesButtonTouchUpInside(_ sender: Any) {
        grapes += 1
        grapesQuantityLabel.text = "\(grapes)"
    }
    
    @IBAction func appleButtonTouchUpInside(_ sender: Any) {
        apple += 1
        appleQuantityLabel.text = "\(apple)"
    }
    
    @IBAction func addAllButtonTouchUpInside(_ sender: Any) {
        bananaButtonTouchUpInside(sender)
        grapesButtonTouchUpInside(sender)
        appleButtonTouchUpInside(sender)
    }
}
