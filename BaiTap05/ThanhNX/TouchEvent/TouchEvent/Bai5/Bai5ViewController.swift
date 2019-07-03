//
//  Bai5ViewController.swift
//  TouchEvent
//
//  Created by PCI0008 on 7/2/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai5ViewController: UIViewController {

    @IBOutlet private weak var appleImage: UIImageView!
    @IBOutlet private weak var appleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appleLabel.layer.cornerRadius = 20
        tapApple()
        doubleTapApple()
    }
    
    func tapApple() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        appleImage.addGestureRecognizer(tap)
    }
    
    func doubleTapApple() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        appleImage.addGestureRecognizer(doubleTap)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            appleLabel.text = "i am Apple"
            appleLabel.isHidden = false
            appleLabel.alpha = 0
            UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                self.appleLabel.alpha = 1
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                    self.appleLabel.alpha = 0
                })
            }
        }
    }
    
    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            appleLabel.text = "Apple is me"
            appleLabel.isHidden = false
            appleLabel.alpha = 0
            UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                self.appleLabel.alpha = 1                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseOut], animations: {
                    self.appleLabel.alpha = 0
                })
            }
        }
    }
}
