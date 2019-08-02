//
//  Ex06ViewController.swift
//  Custom View
//
//  Created by PCI0007 on 7/31/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class Ex06ViewController: UIViewController {
    var chart = ChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chart.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        view.addSubview(chart)
        chart.dataSource = self
        
    }
    
    let monthList: [MonthWithValue] = [MonthWithValue("Jan", 20.0),MonthWithValue("Feb", 4.0),MonthWithValue("Mar", 6.0),MonthWithValue("April", 3.0),MonthWithValue("May", 12.0),MonthWithValue("Jun", 16.0)]




}

extension Ex06ViewController: ChartViewDataSource {
    func arraysOfMonths() -> [MonthWithValue] {
        return monthList
    }
    
    
}
