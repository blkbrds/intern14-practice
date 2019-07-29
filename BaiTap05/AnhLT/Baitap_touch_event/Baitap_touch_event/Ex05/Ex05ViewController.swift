//
//  Ex05ViewController.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/3/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex05ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var monkeyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        textLabel.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        monkeyImageView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.delegate = self
        doubleTap.numberOfTapsRequired = 2
        monkeyImageView.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            textLabel.isHidden = false
            textLabel.text = "Hãy trao cho anh"
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.textLabel.alpha = 1
            })
        }
    }
    
    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            textLabel.isHidden = false
            textLabel.text = "Tất cả"
            UIView.animate(withDuration: 1, delay: 5, options: .curveEaseOut, animations: {
                self.textLabel.alpha = 0
            })
        }
    }
}
