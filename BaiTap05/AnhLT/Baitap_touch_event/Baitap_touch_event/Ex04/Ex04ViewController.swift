//
//  Ex04ViewController.swift
//  Baitap_touch_event
//
//  Created by PCI0013 on 7/2/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet private weak var monkeyImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        pinch.delegate = self
        monkeyImageView.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        rotate.delegate = self
        monkeyImageView.addGestureRecognizer(rotate)
        
        let longPressed = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressed.minimumPressDuration = 5
        longPressed.delaysTouchesBegan = true
        longPressed.delegate = self
        monkeyImageView.addGestureRecognizer(longPressed)
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
            sender.scale = 1
        }
    }
    
    @objc func handleRotate(_ sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = ((sender.view?.transform.rotated(by: sender.rotation))!)
            sender.rotation = 0
        }
    }

    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            monkeyImageView.transform = .identity
        }
    }
}
