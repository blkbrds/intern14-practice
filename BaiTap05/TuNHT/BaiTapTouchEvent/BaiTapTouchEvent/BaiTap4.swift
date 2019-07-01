//
//  BaiTap4.swift
//  BaiTapTouchEvent
//
//  Created by PCI0001 on 7/1/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class BaiTap4: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapGesture(_ sender: UITapGestureRecognizer) {
        print("tap")
    }
    @IBAction func buttonPinch(_ sender: UIPinchGestureRecognizer) {
        print("asdasd")
    }
}
