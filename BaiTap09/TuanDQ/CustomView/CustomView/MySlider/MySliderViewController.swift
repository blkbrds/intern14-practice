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
    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MySliderViewController"
        // Do any additional setup after loading the view.
        sliderPercentView.setting(sliderPosition: mySlider.frame)
        
        
//        guard let nib = Bundle.main.loadNibNamed("CustomSliderViewController", owner: self, options: nil)?[0] as? CustomSliderViewController else { return }
//        nib.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
//        view.addSubview(nib)
        
//    }
        
        guard let nib = Bundle.main.loadNibNamed("NewView", owner: self, options: nil)?[0] as? NewView else { return }
        nib.frame = customView.bounds
        customView.addSubview(nib)

        setCenterPosition()
    }
    @IBAction func changeValueSlider(_ sender: UISlider) {
        setCenterPosition()
    }
    
    private func setCenterPosition() {
        sliderPercentView.center.x = mySlider.thumbCenterX
        sliderPercentView.center.y = mySlider.thumbCenterY + topbarHeight
            - (mySlider.thumbSize.height) + (sliderPercentView.frame.height / 2)
    }
    
}

extension UISlider {
    //this version will return the x coordinate in relation to the UISlider frame
    var thumbCenterX: CGFloat {
        return thumbRect(forBounds: frame, trackRect: trackRect(forBounds: bounds), value: value).midX
    }
    var thumbCenterY: CGFloat {
        return thumbRect(forBounds: frame, trackRect: trackRect(forBounds: bounds), value: value).midY
    }
    var thumbSize: CGSize {
        return thumbRect(forBounds: frame, trackRect: trackRect(forBounds: bounds), value: value).size
    }
}

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
