//
//  MenuViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/10/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet private var baiTapButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        baiTapButtons.forEach { button in
            button.layer.cornerRadius = 10
        }
    }

    @IBAction private func baiTap1ButtonTouchUpInside(_ button: UIButton) {
        let aViewController = AViewController()
        navigationController?.pushViewController(aViewController, animated: true)
    }

    @IBAction private func baiTap2ButtonTouchUpInside(_ button: UIButton) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }

    @IBAction private func baiTap3ButtonTouchUpInside(_ button: UIButton) {
        let listUsersViewController = ListUsersViewController()
        navigationController?.pushViewController(listUsersViewController, animated: true)
    }

    @IBAction private func baiTap4ButtonTouchUpInside(_ button: UIButton) {
        let bai4 = BackGroundViewController()
        navigationController?.pushViewController(bai4, animated: true)
    }
}
