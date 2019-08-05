//
//  MainViewController.swift
//  CustomViewTest
//
//  Created by Nguyen Duong on 8/5/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private  weak var popUpView: UIView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    // MARK: - Custom func
    private func setUpUI() {
        popUpView.isHidden = true
    }

    // MARK: - Actions
    @IBAction func editNameButtonTouchUpInside(_ button: UIButton) {
        print("test")
        popUpView.isHidden = false
        let popUpView = Bundle.main.loadNibNamed("PopUpView", owner: self, options: nil)?[0] as? PopUpView
        popUpView?.frame = CGRect(x: 10, y: 10, width: 500, height: 500)
        view.addSubview(popUpView!)
    }
}
