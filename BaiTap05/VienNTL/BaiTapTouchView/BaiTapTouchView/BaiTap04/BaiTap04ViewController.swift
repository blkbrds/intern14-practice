//
//  BaiTap04ViewController.swift
//  BaiTapTouchView
//
//  Created by Nguyen Truong Lam Vien on 7/2/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class BaiTap04ViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var monkeyImageView: UIImageView?
    private var img = #imageLiteral(resourceName: "monkey")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let handlingPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlingPinchGesture(_:)))
        handlingPinch.delegate = self
        monkeyImageView?.addGestureRecognizer(handlingPinch)
        monkeyImageView?.isUserInteractionEnabled = true

        let handlingRotation = UIRotationGestureRecognizer(target: self, action: #selector(handlingRotationGesture(_:)))
        handlingRotation.delegate = self
        monkeyImageView?.addGestureRecognizer(handlingRotation)
        
        let handlingLongPress = UILongPressGestureRecognizer(target: self, action: #selector(handlingLongPressGesture(_:)))
        handlingLongPress.delegate = self
        monkeyImageView?.addGestureRecognizer(handlingLongPress)
    }
    @objc func handlingPinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
                sender.scale = 1.0;
        }
    }
    
    @objc func handlingLongPressGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            self.becomeFirstResponder()
            self.monkeyImageView?.transform = CGAffineTransform.identity
        }
    }
    
    @objc func handlingRotationGesture(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}
