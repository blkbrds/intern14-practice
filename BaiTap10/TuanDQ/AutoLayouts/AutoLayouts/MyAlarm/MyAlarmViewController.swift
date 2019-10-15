//
//  MyAlarmViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/15/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyAlarmViewController: UIViewController {

    @IBOutlet weak var alarmScrollView: UIView!
    @IBOutlet weak var usernameLabel: NSLayoutConstraint!
    @IBOutlet weak var dateAlarmLabel: UILabel!
    @IBOutlet weak var alarmContentLabel: UILabel!
    @IBOutlet weak var minuteRemainView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var alarmInformationView: HexagonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isToolbarHidden = true
        // Do any additional setup after loading the view.
        alarmContentLabel.adjustsFontSizeToFitWidth = true
    }
}
