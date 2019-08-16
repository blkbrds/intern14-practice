//
//  ExNaviViewController.swift
//  ExNavigation
//
//  Created by PCI0010 on 8/7/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class ExNaviViewController: UIViewController {

    @IBOutlet private var abc: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        for button in abc {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 20
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    let viewController: [UIViewController] = [ViewA(),LoginController(),MyAvatarViewController(),CustomNaviBarViewController()]
    
    @IBAction private func exNavi(_ sender: UIButton) {
        navigationController?.pushViewController(viewController[sender.tag], animated: true)
    }

  
}
