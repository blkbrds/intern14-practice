//
//  PracticeNineViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/12/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PracticeNineViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentDisplayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load first image.
        mainImageView.image = UIImage(named: "firstImage.png")
        contentDisplayTextView.translatesAutoresizingMaskIntoConstraints = true
        contentDisplayTextView.sizeToFit()
        contentDisplayTextView.isScrollEnabled = false
    }

    @IBAction func changeImageButtonClick(_ sender: UIButton) {
        if (sender.tag == 1) {
            // next image
        } else {
            // previous image.
        }
    }
    @IBAction func interactButtonClick(_ sender: UIButton) {
        if (sender.tag == 4) {
            print("Like button is clicked.")
        } else if (sender.tag == 5) {
            print("Comment button is clicked.")
        } else {
            print("Share button is clicked.")
        }
    }
}
