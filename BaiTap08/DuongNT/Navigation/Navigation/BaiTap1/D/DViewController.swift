//
//  DViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/8/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    // Marks: - Outlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var cButton: UIButton!
    @IBOutlet private weak var bButton: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    // Marks: - Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    // Marks: - Private/public custom function
    private func setUpViews() {
        title = "View Controller D"
        nextButton.layer.cornerRadius = 5
        cButton.layer.cornerRadius = 5
        bButton.layer.cornerRadius = 5
        rootButton.layer.cornerRadius = 5
        navigationController?.navigationBar.backgroundColor = .cyan
    }

    // Marks: - IBAction function
    @IBAction func nextButtonTouchUpInside(_ button: UIButton) {
        let eViewController = EViewController()
        navigationController?.pushViewController(eViewController, animated: true)
    }

    @IBAction func cButtonTouchUpInside(_ button: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: CViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }

    @IBAction func bButtonTouchUpInside(_ button: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: BViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }

    @IBAction func rootButtonTouchUpInside(_ button: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
