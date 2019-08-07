//
//  BarChartViewController.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 8/6/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class BarChartViewController: UIViewController {
    var items: [Chart] = [Chart("Jan", 20.0),
                          Chart("Feb", 4.0),
                          Chart("Mar", 6.0),
                          Chart("Apr", 3.0),
                          Chart("May", 12.0),
                          Chart("Jun", 16.0),
                          Chart("Jul", 4.0),
                          Chart("Aug", 18.0),
                          Chart("Sep", 2.0),
                          Chart("Oct", 4.0),
                          Chart("Nov", 5.0),
                          Chart("Dec", 4.0),
                        ]
     var myBarChart = MyBarChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        myBarChart.dataSource = self
        myBarChart.output()
        view.addSubview(myBarChart)
    }
}

extension BarChartViewController: MyBarChartDataSource {
    func nameAndValue() -> [Chart] {
        return items
    }
    
    func columnNumber() -> Int {
        return items.count
    }
}
