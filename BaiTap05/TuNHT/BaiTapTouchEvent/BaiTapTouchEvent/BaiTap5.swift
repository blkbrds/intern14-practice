//
//  BaiTap5.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 7/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap5: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet private weak var gorillaImageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gorillaImageView.isUserInteractionEnabled = true
        textLabel.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        gorillaImageView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.delegate = self
        doubleTap.numberOfTapsRequired = 2
        gorillaImageView.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            UIView.animate(withDuration: 1, animations: {
                self.textLabel.alpha = 1
            })
            textLabel.isHidden = false
            textLabel.text = "óc chó Vũ"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 1, delay: 5, options: .curveEaseOut, animations: {
                    self.textLabel.alpha = 0
                })
            }
        }
    }
    
    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .ended {
            UIView.animate(withDuration: 1, animations: {
                self.textLabel.alpha = 1
            })
            textLabel.text = "Vũ óc chó"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIView.animate(withDuration: 1, delay: 5, options: .curveEaseOut, animations: {
                        self.textLabel.alpha = 0
                    })
            }
        }
    }
}
