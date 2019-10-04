//
//  MyPickerViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/4/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyPickerViewController: UIViewController {

    @IBOutlet weak var pickerConvertView: UIView!
    @IBOutlet weak var dateTimePickView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let nib = Bundle.main.loadNibNamed("PickerView", owner: self, options: nil)?[0] as? PickerView else { return }

        // Event change size with current bounds. - Understanding it is.
        nib.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        nib.delegate = self
        pickerConvertView.addSubview(nib)
        
       
    }

}
