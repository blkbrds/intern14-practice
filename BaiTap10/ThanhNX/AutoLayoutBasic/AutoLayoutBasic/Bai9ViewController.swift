//
//  Bai9ViewController.swift
//  AutoLayoutBasic
//
//  Created by PCI0008 on 8/6/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai9ViewController: UIViewController {
    @IBOutlet weak var bigScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigScrollView.contentSize = CGSize(width: 414 * 10, height: 818)
    }
}
