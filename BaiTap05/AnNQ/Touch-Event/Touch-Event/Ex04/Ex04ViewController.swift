//
//  Ex04ViewController.swift
//  Touch-Event
//
//  Created by MBA0217 on 8/26/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex04ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var monkeyImagevView: UIImageView!
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = monkeyImagevView.frame.width
        height = monkeyImagevView.frame.height
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2.0
        
        pinchGestureRecognizer()
        rotationGestureRecognizer()
        longPressGestureRecognizer()
        // Do any additional setup after loading the view.
    }
    
    func pinchGestureRecognizer() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchActionZoomImage(_:)))
        monkeyImagevView.addGestureRecognizer(pinchGesture)
        monkeyImagevView.isUserInteractionEnabled = true
    }
    
    @objc func pinchActionZoomImage(_ gestureRecognizer :
        UIPinchGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            if let view = gestureRecognizer.view {
                view.transform = view.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
                gestureRecognizer.scale = 1
            }
            if monkeyImagevView.frame.width >= (width * scrollView.maximumZoomScale) {
                monkeyImagevView.frame.size.width = width * scrollView.maximumZoomScale
                monkeyImagevView.frame.size.height = height * scrollView.maximumZoomScale
            } else if monkeyImagevView.frame.width <= (width * scrollView.minimumZoomScale) {
                monkeyImagevView.frame.size.width = width * scrollView.minimumZoomScale
                monkeyImagevView.frame.size.height = height * scrollView.minimumZoomScale
            }
            monkeyImagevView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        }
    }
    
    func rotationGestureRecognizer() {
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotatePieceAction(_:)))
        monkeyImagevView.addGestureRecognizer(rotationGesture)
//        monkeyImagevView.isUserInteractionEnabled = true
    }
    
    @objc func rotatePieceAction(_ gestureRecognizer : UIRotationGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
        }
    }
    
    func longPressGestureRecognizer() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(_:)))
        longPressGesture.minimumPressDuration = 5
        monkeyImagevView.addGestureRecognizer(longPressGesture)
//        monkeyImagevView.isUserInteractionEnabled = true
    }
    
    @objc func longPressAction(_ gestureRecognizer: UILongPressGestureRecognizer) {
        guard gestureRecognizer.view != nil else {
            return
        }
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(_:)))
        monkeyImagevView.addGestureRecognizer(longPressGesture)
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
//            Timer(timeInterval: 5, repeats: false) { _ in
                if let view = gestureRecognizer.view {
                    view.transform = .identity
                }
                monkeyImagevView.frame.size.width = width
                monkeyImagevView.frame.size.height = height
                monkeyImagevView.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
//            }
        }
    }
    

}
