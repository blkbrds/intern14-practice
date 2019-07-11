//
//  EViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/8/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class EViewController: UIViewController {

    // Marks: Properties
    
    @IBOutlet private weak var cButton: UIButton!
    @IBOutlet private weak var bButton: UIButton!
    @IBOutlet private weak var dButton: UIButton!
    @IBOutlet private weak var rootButton: UIButton!
    
    // Marks: Life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // Marks: Private/public custom function
    
    private func setUpViews() {
        title = "View Controller E"
        cButton.layer.cornerRadius = 5
        bButton.layer.cornerRadius = 5
        dButton.layer.cornerRadius = 5
        rootButton.layer.cornerRadius = 5
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    // Marks: IBAction function
    
    @IBAction func cButtonTouchUpInside(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: CViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func bButtonTouchUpInside(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: BViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func dButtonTouchUpInside(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: DViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
