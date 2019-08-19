//
//  HomeViewController.swift
//  ExTouchEvent
//
//  Created by PCI0010 on 8/15/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var ExButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configUI() {
        title = "Home"
        navigationController?.navigationBar.backgroundColor = .cyan
        for button in ExButton {
            button.layer.borderWidth = 1.5
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 20
        }
    }
    
    let viewController: [UIViewController] = [BallViewController(),SliderViewController(),PaintViewController(),MonkeyViewController(),MonkeyTalkViewController()]
    
    @IBAction private func exTouchEvent(_ sender: UIButton) {
        navigationController?.pushViewController(viewController[sender.tag], animated: true)
    }
    
}
