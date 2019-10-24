//
//  ScheduleDetailViewController.swift
//  DatingMessenger
//
//  Created by MBA0051 on 10/23/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

enum JoinStatus: Int {
    case join
    case reject
    case confirm
    
    var getTag: Int {
        switch self {
        case .join:
            return 11
        case .reject:
            return 12
        case .confirm:
            return 13
        }
    }
}

class ScheduleDetailViewController: UIViewController {

    @IBOutlet weak var scheduleTitle: UILabel!
    @IBOutlet weak var scheduleDayLabel: UILabel!
    @IBOutlet weak var scheduleMonthLabel: UILabel!
    @IBOutlet weak var scheduleTimeLabel: UILabel!
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var scheduleContentLabel: UILabel!
    @IBOutlet weak var joinDatingButton: UIButton!
    @IBOutlet weak var rejectDatingButton: UIButton!
    @IBOutlet weak var confirmDatingButton: UIButton!
    @IBOutlet weak var viewMapButton: UIButton!
    @IBOutlet weak var endDayLabel: UILabel!
    @IBOutlet weak var endMonthLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var endMeridiemLabel: UILabel!
    
    var viewModel: ScheduleDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateLayout()
    }
    
    private func updateLayout() {
        if let viewModel = viewModel {
            scheduleTitle?.text = viewModel.scheduleTitle
            scheduleDayLabel?.text = "10"
            scheduleMonthLabel?.text = "11"
            scheduleTimeLabel?.text = viewModel.timeSchedule
            meridiemLabel?.text = "PM"
            scheduleContentLabel?.text = viewModel.contentSchedule
        }
    }
    
    @IBAction func changeScheduleStatusButtonClick(_ sender: UIButton) {
        
        let mapDetailViewController = MapDetailViewController()
        mapDetailViewController.latitude = 16.0472484
        mapDetailViewController.longitude = 108.1716005
        navigationController?.pushViewController(mapDetailViewController, animated: true)
    }
    
    @IBAction func viewMapButtonClick(_ sender: UIButton) {
        navigationController?.pushViewController(MapDetailViewController(), animated: true)
    }
}
