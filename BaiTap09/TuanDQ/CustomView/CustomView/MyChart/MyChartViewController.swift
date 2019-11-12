//
//  MyChartViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/4/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MyChartViewController"
        guard let nib = Bundle.main.loadNibNamed("ChartView", owner: self, options: nil)?[0] as? ChartView else { return }
//        nib.frame = itemView.bounds
//        nib.setting(color: badgetColor, type: title, number: numberOfNotification, location: localtion)
        nib.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        nib.tag = viewTag
//        nib.delegate = self
        view.addSubview(nib)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
