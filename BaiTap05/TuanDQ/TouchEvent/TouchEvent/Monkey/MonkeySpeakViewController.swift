//
//  MonkeySpeakViewController.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MonkeySpeakViewController: UIViewController {

    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var monkeyMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(checkDoubeTap))
        doubleTapGest.numberOfTapsRequired = 2

        let singleTapGest = UITapGestureRecognizer(target: self, action: #selector(checkSingleTap))
        singleTapGest.numberOfTapsRequired = 1
        
        view.addGestureRecognizer(doubleTapGest)
        view.addGestureRecognizer(singleTapGest)
        singleTapGest.require(toFail: doubleTapGest)
    }
    
    @objc func checkSingleTap() {
        monkeyMessageLabel.text = "Tôi là khỉ"
        displayAnime()
    }

    @objc func checkDoubeTap() {
        monkeyMessageLabel.text = "Khỉ là tôi"
        displayAnime()
    }
    
    /**
     * Display animation show/hide.
     */
    private func displayAnime() {
        
        defer { UIView.setAnimationsEnabled(!true) }
        let animationEnabled = UIView.areAnimationsEnabled

        if animationEnabled != true {
            UIView.setAnimationsEnabled(true)
        }
        
        self.messageView.alpha = 1
        messageView.isHidden = false
        UIView.animate(withDuration: 5) {
            self.messageView.alpha = 0
        }
    }
}
