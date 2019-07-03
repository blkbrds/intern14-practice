//
//  BaiTap4.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 7/2/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap4: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet private weak var gorillaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gorillaImageView.isUserInteractionEnabled = true
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPress.delegate = self
        longPress.minimumPressDuration = 5
        gorillaImageView.addGestureRecognizer(longPress)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        pinch.delegate = self
        gorillaImageView.addGestureRecognizer(pinch)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation))
        rotation.delegate = self
        gorillaImageView.addGestureRecognizer(rotation)
    }
    
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state != UIGestureRecognizer.State.ended {
            //When lognpress is start or running
            gorillaImageView.frame = CGRect(x: 91.0, y: 384.0, width: 232.0, height: 128.0)
        }
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        }
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}
