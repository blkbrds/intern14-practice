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
    @IBOutlet weak var degreeValueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MySliderViewController"
        
        guard let nib = Bundle.main.loadNibNamed("SliderItem", owner: self, options: nil)?[0] as? SliderItem else { return }
        nib.frame = sliderContainerView.bounds
        sliderContainerView.addSubview(nib)
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

extension MySliderViewController: SliderItemDelegate {
    
    func getValueChange(view: SliderItem, value: String) {
        degreeValueTextField.text = value
    }
//
//    func view(_ view: AvatarItemView, didSelect index: String?) {
//            UserDefaults.standard.set(index, forKey: CommonConstant.PROFILE_ID)
//            navigationController?.pushViewController(PersonDetailViewController(), animated: true)
//    }
}
