//
//  AvatarsViewController.swift
//  Avatars
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class AvatarsViewController: UIViewController {

    @IBOutlet weak var avatar1: UIImageView!
    @IBOutlet weak var avatar2: UIImageView!
    @IBOutlet weak var avatar3: UIImageView!
    @IBOutlet weak var avatar4: UIImageView!
    @IBOutlet weak var avatar5: UIImageView!
    @IBOutlet weak var avatar6: UIImageView!
    @IBOutlet weak var avatar7: UIImageView!
    @IBOutlet weak var avatar8: UIImageView!
    @IBOutlet weak var avatar9: UIImageView!
    
    @IBOutlet weak var personName1: UILabel!
    @IBOutlet weak var personName2: UILabel!
    @IBOutlet weak var personName3: UILabel!
    @IBOutlet weak var personName4: UILabel!
    @IBOutlet weak var personName5: UILabel!
    @IBOutlet weak var personName6: UILabel!
    @IBOutlet weak var personName7: UILabel!
    @IBOutlet weak var personName8: UILabel!
    @IBOutlet weak var personName9: UILabel!
    
    @IBOutlet weak var personInfo1: UIButton!
    @IBOutlet weak var personInfo2: UIButton!
    @IBOutlet weak var personInfo3: UIButton!
    @IBOutlet weak var personInfo4: UIButton!
    @IBOutlet weak var personInfo5: UIButton!
    @IBOutlet weak var personInfo6: UIButton!
    @IBOutlet weak var personInfo7: UIButton!
    @IBOutlet weak var personInfo8: UIButton!
    @IBOutlet weak var personInfo9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func viewPersonInformation(_ sender: UIButton) {
        switch sender {
        case personInfo1:
            print("Avatar name : \(personName1.text!)")
        case personInfo2:
            print("Avatar name : \(personName2.text!)")
        case personInfo3:
            print("Avatar name : \(personName3.text!)")
        case personInfo4:
            print("Avatar name : \(personName4.text!)")
        case personInfo5:
            print("Avatar name : \(personName5.text!)")
        case personInfo6:
            print("Avatar name : \(personName6.text!)")
        case personInfo7:
            print("Avatar name : \(personName7.text!)")
        case personInfo8:
            print("Avatar name : \(personName8.text!)")
        case personInfo9:
            print("Avatar name : \(personName9.text!)")
        default:
            print("Have no information")
        }
    }
}
