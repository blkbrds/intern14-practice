//
//  Ex03.swift
//  BaitapIBaction
//
//  Created by PCI0007 on 6/27/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex03: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var userView1: UIView!
    @IBOutlet weak var userAvatarView1: UIView!
    @IBOutlet weak var userNameLabel1: UILabel!
    @IBOutlet weak var userView2: UIView!
    @IBOutlet weak var userAvatar2: UIView!
    @IBOutlet weak var userNameLabel2: UILabel!
    @IBOutlet weak var userView3: UIView!
    @IBOutlet weak var userAvatarView3: UIView!
    @IBOutlet weak var userNameLabel3: UILabel!
    @IBOutlet weak var userView4: UIView!
    @IBOutlet weak var userAvatar4View: UIView!
    @IBOutlet weak var userNameLabel4: UILabel!
    @IBOutlet weak var userView5: UIView!
    @IBOutlet weak var userAvatar5View: UIView!
    @IBOutlet weak var userNameLabel5: UILabel!
    @IBOutlet weak var userView6: UIView!
    @IBOutlet weak var userAvatar6View: UIView!
    @IBOutlet weak var userNameLabel6: UILabel!
    @IBOutlet weak var userView7: UIView!
    @IBOutlet weak var userAvatar7View: UIView!
    @IBOutlet weak var userNameLabel7: UILabel!
    @IBOutlet weak var userView8: UIView!
    @IBOutlet weak var userAvatar8View: UIView!
    @IBOutlet weak var userNameLabel8: UILabel!
    @IBOutlet weak var userView9: UIView!
    @IBOutlet weak var userAvatar9View: UIView!
    @IBOutlet weak var userNameLabel9: UILabel!
    @IBOutlet var userContainer: [UIView]!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == userView2 {
                print("1")
            } else if touch.view == userView1 {
                print("2")
            } else if touch.view == userView3 {
                print("3")
            } else if touch.view == userView4 {
                print("4")
            } else if touch.view == userView5 {
                print("5")
            } else if touch.view == userView6 {
                print("6")
            } else if touch.view == userView7 {
                print("7")
            } else if touch.view == userView8 {
                print("8")
            } else if touch.view == userView9 {
                print("9")
            }
    }
}
}
