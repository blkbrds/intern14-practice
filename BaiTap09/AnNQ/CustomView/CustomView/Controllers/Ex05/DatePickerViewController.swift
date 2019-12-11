//
//  DatePickerViewController.swift
//  CustomView
//
//  Created by MBA0217 on 10/1/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wrapperDatePickerView: UIView!
    var datePickerView = DatePickerView.loadNibNamed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        dateLabel.text = formatter.string(from: date)
        datePickerView.delegate = self
        wrapperDatePickerView.addSubview(datePickerView)
    }
}

extension DatePickerViewController: DatePickerViewDelegate{
    func setDateTimeNow(strDate: String) {
        dateLabel.text = strDate
    }
    
    
}
