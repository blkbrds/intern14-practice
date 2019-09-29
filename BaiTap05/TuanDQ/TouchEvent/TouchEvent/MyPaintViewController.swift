//
//  MyPaintViewController.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyPaintViewController: UIViewController {

    

    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var drawMainView: UIView!
    @IBOutlet weak var greenBrush: UIButton!
    @IBOutlet weak var redBrush: UIButton!
    @IBOutlet weak var lightBlueBrush: UIButton!
    @IBOutlet weak var yellowBrush: UIButton!
    @IBOutlet weak var indigoBrush: UIButton!
    @IBOutlet weak var orangeBrush: UIButton!
    @IBOutlet weak var whiteBrush: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTapGest = UITapGestureRecognizer(target: self, action: #selector(checkSingleTap))
        singleTapGest.numberOfTapsRequired = 1
        
        view.addGestureRecognizer(singleTapGest)
    }

    @objc func checkSingleTap() {
        
    }
}
