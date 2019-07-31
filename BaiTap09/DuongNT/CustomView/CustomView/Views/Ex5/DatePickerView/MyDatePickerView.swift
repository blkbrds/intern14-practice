//
//  MyDatePickerView.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/26/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class MyDatePickerView: UIDatePicker {

    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUIDatePicker()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Set up UI
    func setUpUIDatePicker() {
        self.datePickerMode = .date
    }
}
