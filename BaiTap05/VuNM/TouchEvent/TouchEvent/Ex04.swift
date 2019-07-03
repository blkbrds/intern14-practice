//
//  Ex04.swift
//  TouchEvent
//
//  Created by PCI0007 on 7/2/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex04: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var sampleImageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch.delegate = self
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(_:)))
        rotate.delegate = self
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongpress(_:)))
        longPress.delegate = self
        sampleImageView.isUserInteractionEnabled = true
        sampleImageView.addGestureRecognizer(rotate)
        sampleImageView.addGestureRecognizer(pinch)
        sampleImageView.addGestureRecognizer(longPress)
        longPress.minimumPressDuration = 5
    }
    
    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard gesture.view != nil else { return }
        if gesture.state == .began || gesture.state == .changed  {
            gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
            gesture.scale = 1.0
            
        }
    
    }
    
    @objc func handleRotate(_ gesture: UIRotationGestureRecognizer) {
        guard gesture.view != nil else { return }
        if gesture.state == .began || gesture.state == .changed {
            gesture.view?.transform = gesture.view!.transform.rotated(by: gesture.rotation)
            gesture.rotation = 0
        }
    }
    
    @objc func handleLongpress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            self.sampleImageView.transform = CGAffineTransform.identity
        }
    }
    

}
