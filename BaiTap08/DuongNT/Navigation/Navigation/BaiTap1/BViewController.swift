//
//  BViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/8/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    // Marks: Properties
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!
    
    // Marks: Life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // Marks: Private/public custom function
    
    private func setUpViews() {
        title = "View Controller B"
        nextButton.layer.cornerRadius = 5
        previousButton.layer.cornerRadius = 5
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    // Marks: IBAction function
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let cViewController = CViewController()
        navigationController?.pushViewController(cViewController, animated: true)
    }
    
    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
