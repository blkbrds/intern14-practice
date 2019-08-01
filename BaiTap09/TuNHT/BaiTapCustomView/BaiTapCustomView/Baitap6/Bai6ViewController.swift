//
//  BaiTap5.swift
//  BaiTapView
//
//  Created by PCI0001 on 6/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit


class Bai6ViewController: UIViewController {
    var myChartView = MyChartView()
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
                          Chart("Dec", 4.0),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myChartView.dataSource = self
        myChartView.output()
        view.addSubview(myChartView)
        print(UIScreen.main.bounds.width)
        print(UIScreen.main.bounds.height)
    }
}

extension Bai6ViewController: MyChartViewDataSource {
    func nameAndValueOfChart() -> [Chart] {
        return items
    }
    
    func numberOfColumns() -> Int {
        return items.count
    }
}
