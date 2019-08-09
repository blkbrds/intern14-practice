//
//  Bai13ViewController.swift
//  BaiTapAutoLayout
//
//  Created by PCI0001 on 8/9/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Bai13ViewController: UIViewController {
    @IBOutlet weak var ronaldoImageView: UIImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var setUnlockView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ronaldoImageView.layer.cornerRadius = ronaldoImageView.bounds.width / 2
        ronaldoImageView.layer.masksToBounds = true
        
        profileView.layer.borderWidth = 1
        usernameView.layer.borderWidth = 1
        setUnlockView.layer.borderWidth = 1
    }
}
