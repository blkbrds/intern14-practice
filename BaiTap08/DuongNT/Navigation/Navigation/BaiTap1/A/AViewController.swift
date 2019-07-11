//
//  AViewController.swift
//  Navigation
//
//  Created by Nguyen Duong on 7/8/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    // Marks: Properties
    
    @IBOutlet private weak var nextButton: UIButton!
    
    // Marks: Life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // Marks: Private/public custom function
    
    private func setUpViews() {
        title = "View Controller A"
        nextButton.layer.cornerRadius = 5
        navigationController?.navigationBar.backgroundColor = .cyan
    }
    
    // Marks: IBAction function
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        let bViewController = BViewController()
        navigationController?.pushViewController(bViewController, animated: true)
    }
}
