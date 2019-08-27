//
//  Ex02ViewController.swift
//  Touch-Event
//
//  Created by MBA0217 on 8/23/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex02ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var whiteLabel: UILabel!
    @IBOutlet weak var percenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateTemplateView()
        // Do any additional setup after loading the view.
    }


    func updateTemplateView() {
        whiteLabel.layer.borderColor = UIColor.blue.cgColor
        whiteLabel.layer.borderWidth = 1
        
        blueLabel.layer.borderColor = UIColor.blue.cgColor
        blueLabel.layer.borderWidth = 1
        
        percenButton.layer.cornerRadius = percenButton.bounds.width / 2
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position =  touch.location(in: self.containerView)

            if touch.view == containerView {
                if position.y >= 0 && position.y <= containerView.bounds.height - 21 {
                    whiteLabel.frame = CGRect(x: whiteLabel.frame.origin.x, y: whiteLabel.frame.origin.y, width: whiteLabel.bounds.width, height: position.y)
                    
                    percenButton.frame = CGRect(x: percenButton.frame.origin.x, y: whiteLabel.bounds.height - 25, width: percenButton.bounds.width, height: percenButton.bounds.height)
                    
                    let percent =  100 - whiteLabel.bounds.height * 100 / blueLabel.bounds.height
                    percenButton.setTitle("\(Int(percent))", for: .normal)
                }
            }
        }
    }

}
