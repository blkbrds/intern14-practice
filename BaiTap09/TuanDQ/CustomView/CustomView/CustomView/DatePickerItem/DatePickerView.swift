//
//  DatePickerView.swift
//  CustomView
//
//  Created by MBA0051 on 10/4/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class DatePickerView: ParentView {

    @IBOutlet weak var datePickerItem: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        datePickerItem.dataSource = self
        datePickerItem.delegate = self
    }
}
