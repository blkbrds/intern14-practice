//
//  BaiTap05ViewController.swift
//  BaiTapTouchView
//
//  Created by Nguyen Truong Lam Vien on 7/3/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap05ViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet private weak var monkeyImageView: UIImageView!
    @IBOutlet private weak var contentShowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyImageView.isUserInteractionEnabled = true
        contentShowLabel.layer.cornerRadius = 15
        contentShowLabel.clipsToBounds = true
        contentShowLabel.isHidden = true
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
        singleTap.delegate = self
        monkeyImageView.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        doubleTap.delegate = self
        doubleTap.numberOfTapsRequired = 2
        monkeyImageView.addGestureRecognizer(doubleTap)
    }
    
    @objc private func singleTap(_ tap: UITapGestureRecognizer) {
        if tap.state == .ended {
            self.contentShowLabel.isHidden = false
            self.contentShowLabel.alpha = 1
            contentShowLabel.text = "TÔI là KHỈ"
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UILabel.animate(withDuration: 1, animations: {
                    self.contentShowLabel.alpha = 0
                }, completion: nil)
            }
        }
    }
    
    @objc private func doubleTap(_ tap: UITapGestureRecognizer) {
        if tap.state == .ended {
            self.contentShowLabel.isHidden = false
            self.contentShowLabel.alpha = 1
            contentShowLabel.text = "KHỈ là TÔI"
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                UILabel.animate(withDuration: 1, animations: {
                    self.contentShowLabel.alpha = 0
                }, completion: nil)
            }
        }
    }
}
