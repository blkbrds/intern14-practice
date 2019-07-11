//
//  CViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/8/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    // Marks: Properties
    
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
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let dViewController = DViewController()
        navigationController?.pushViewController(dViewController, animated: true)
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rootButtonTouchUpInside(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
