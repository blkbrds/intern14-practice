//
//  EViewController.swift
//  Navigation
//
//  Created by PCI0008 on 7/9/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class EViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 50
        }
        title = "Navigation E"
        navigationController?.navigationBar.backgroundColor = .purple
    }
    
    @IBAction func bButtonTouchUpInside(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is BViewController }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
    
    @IBAction func cButtonTouchUpInside(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is CViewController }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
    
    @IBAction func dButtonTouchUpInside(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func rootButtonUpInside(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is AViewController }) else { return }
        navigationController?.popToViewController(viewController, animated: true)
    }
}
