//
//  MySliderViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/2/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MySliderViewController: UIViewController {

    @IBOutlet weak var sliderContainerView: UIView!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderPercentView: DegreeItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MySliderViewController"
        // Do any additional setup after loading the view.
        sliderPercentView.setting(sliderPosition: mySlider.frame)
    }
    @IBAction func changeValueSlider(_ sender: UISlider) {
        sliderPercentView.frame.
    }
    
}
