//
//  MyBadgeViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/3/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyBadgeViewController: UIViewController {

    @IBOutlet weak var emailButton: UIView!
    @IBOutlet weak var friendsButton: UIView!
    @IBOutlet weak var photosButton: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MySliderViewController"
        
        loadNibToView(view: emailButton, color: .blue, start: 1, tag: 1)
        loadNibToView(view: friendsButton, color: .green, start: 2, tag: 2)
        loadNibToView(view: photosButton, color: .orange, start: 10, tag: 3)
    }


    private func loadNibToView(view itemView: UIView, color minColor: UIColor, start startValue: Float, tag viewTag: Int) {
        guard let nib = Bundle.main.loadNibNamed("SliderItem", owner: self, options: nil)?[0] as? BadgeButtonItem else { return }
        nib.frame = itemView.bounds
//        nib.setting(color: minColor, start: startValue)
        nib.tag = viewTag
//        nib.delegate = self
//        uiTextField.text = nib.getCurrentPercent()
        itemView.addSubview(nib)
    }

}
