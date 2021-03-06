//
//  CViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/8/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    // Marks: Outlets
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet private weak var rootButton: UIButton!

    // Marks: Life cycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    // Marks: Private/public custom function
    private func setUpViews() {
        title = "View Controller C"
        nextButton.layer.cornerRadius = 5
        previousButton.layer.cornerRadius = 5
        rootButton.layer.cornerRadius = 5
        navigationController?.navigationBar.backgroundColor = .cyan
    }

    // Marks: IBAction function
    @IBAction private func nextButtonTouchUpInside(_ button: UIButton) {
        let dViewController = DViewController()
        navigationController?.pushViewController(dViewController, animated: true)
    }

    @IBAction private func previousButtonTouchUpInside(_ button: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction private func rootButtonTouchUpInside(_ button: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
