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
    var mainWidth: CGFloat = 0
    var mainHeight: CGFloat = 0
    var mainTransform: CGAffineTransform?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let handlingPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlingPinchGesture(_:)))
        handlingPinch.delegate = self
        mainWidth = monkeyImageView?.frame.width ?? 0.0
        mainHeight = monkeyImageView?.frame.height ?? 0.0
        monkeyImageView?.addGestureRecognizer(handlingPinch)
        monkeyImageView?.isUserInteractionEnabled = true
        mainTransform = monkeyImageView?.transform

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
            sender.scale = 1.0
        }
        
        if let width = monkeyImageView?.frame.width, width > mainWidth * 2 {
            monkeyImageView?.frame.size.width = mainWidth * 2
            monkeyImageView?.frame.size.height = mainHeight * 2
        } else if let width = monkeyImageView?.frame.width, width < mainWidth * 0.5 {
            monkeyImageView?.frame.size.width = mainWidth * 0.5
            monkeyImageView?.frame.size.height = mainHeight * 0.5
        }
        monkeyImageView?.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
    }
    
    @objc func handlingLongPressGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            guard let mainTransform = mainTransform else { return }
            print(mainTransform)
            self.monkeyImageView?.transform = mainTransform
        }
    }
    
    @objc func handlingRotationGesture(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
}
