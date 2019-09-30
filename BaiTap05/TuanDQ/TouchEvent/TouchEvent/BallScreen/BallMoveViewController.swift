//
//  BallMoveViewController.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class BallMoveViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        if touch.view == ballImageView {
            ballImageView.center = touch.location(in: self.view)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
