//
//  CalculatorViewController.swift
//  MVC
//
//  Created by MBA0217 on 9/3/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // Do any additional setup after loading the view.
    }
    
    func configUI () {
        //result Label
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.borderColor = UIColor.blue.cgColor
    }
    
    

}
