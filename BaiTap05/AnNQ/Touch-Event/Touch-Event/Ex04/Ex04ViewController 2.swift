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
    @IBOutlet weak var commentView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    var width: CGFloat = 0
    var height: CGFloat = 0
    var countDown = 5
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = monkeyImagevView.frame.width
        height = monkeyImagevView.frame.height
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2.0
        commentView.isHidden = true
        commentLabel.isHidden = true
        
        //Ex 04
        pinchGestureRecognizer()
        rotationGestureRecognizer()
        longPressGestureRecognizer()

        //Ex 05
        tapGestureRecognizer()
        doubleTapGestureRecognizer()
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
    
    func tapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        monkeyImagevView.addGestureRecognizer(tapGesture)
        monkeyImagevView.isUserInteractionEnabled = true
    }
    
    @objc func tapAction(_ gestureRecognizer : UITapGestureRecognizer ) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .ended {
            commentView.isHidden = false
            commentLabel.text = "Tôi là khỉ"
            commentLabel.isHidden = false
            commentView.alpha = 0
            commentLabel.alpha = 0
            
            appearLabel()
        }
    }
    
    func doubleTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction(_:)))
        tapGesture.numberOfTapsRequired = 2
        monkeyImagevView.addGestureRecognizer(tapGesture)
        monkeyImagevView.isUserInteractionEnabled = true
    }
    
    @objc func doubleTapAction(_ gestureRecognizer : UITapGestureRecognizer ) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .ended {
            commentView.isHidden = false
            commentLabel.text = "Khỉ là tôi"
            commentLabel.isHidden = false
            appearLabel()
        }
    }
    
    func hiddenInFiveSeconds () {
        countDown = 5
        if let _ = timer { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }

    @objc func updateCounter() {
        print(countDown)
        if countDown > 0 {
            countDown -= 1
            
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut], animations: {
                    self.commentView.alpha = 0
                    self.commentLabel.alpha = 0
                    },
                   completion: { _ in
                        self.timer?.invalidate()
                        self.timer = nil
                    }
                )
            }
        }
    }
    
    func appearLabel() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                self.commentView.alpha = 1
                self.commentLabel.alpha = 1
            },
                completion: { _ in
                    self.hiddenInFiveSeconds()
            }
        )
    }
}
