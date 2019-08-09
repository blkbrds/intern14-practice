//
//  MenuViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/10/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var baiTapButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        baiTapButtons.forEach {
            button in
            button.layer.cornerRadius = 10
        }
    }

    @IBAction func baiTap1ButtonTouchUpInside(_ sender: Any) {
        let aViewController = AViewController()
        navigationController?.pushViewController(aViewController, animated: true)
    }
    @IBAction func baiTap2ButtonTouchUpInside(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    @IBAction func baiTap3ButtonTouchUpInside(_ sender: Any) {
        let listUsersViewController = ListUsersViewController()
        navigationController?.pushViewController(listUsersViewController, animated: true)
    }
    @IBAction func baiTap4ButtonTouchUpInside(_ sender: Any) {
        let bai4 = BackGroundViewController()
        navigationController?.pushViewController(bai4, animated: true)
    }
}
