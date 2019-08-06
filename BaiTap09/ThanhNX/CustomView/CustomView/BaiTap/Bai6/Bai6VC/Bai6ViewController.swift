//
//  Bai6ViewController.swift
//  CustomView
//
//  Created by PCI0008 on 7/31/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

final class Bai6ViewController: UIViewController {
    
    private let unitsSoldData: [Charts] = [
        Charts(month: "Jan", percent: 20.0),
        Charts(month: "Feb", percent: 4.0),
        Charts(month: "Mar", percent: 6.0),
        Charts(month: "Apr", percent: 3.0),
        Charts(month: "May", percent: 12.0),
        Charts(month: "Jun", percent: 16.0),
        Charts(month: "July", percent: 4.0),
        Charts(month: "Aug", percent: 20.0),
        Charts(month: "Sep", percent: 2.0),
        Charts(month: "Oct", percent: 4.0),
        Charts(month: "Nov", percent: 5.0),
        Charts(month: "Dec", percent: 4.0)]
    
    private let unitsSoldPercent: [Charts] = [Charts(month: "", percent: 20),
                                Charts(month: "", percent: 19),
                                Charts(month: "", percent: 18),
                                Charts(month: "", percent: 17),
                                Charts(month: "", percent: 16),
                                Charts(month: "", percent: 15),
                                Charts(month: "", percent: 14),
                                Charts(month: "", percent: 13),
                                Charts(month: "", percent: 12),
                                Charts(month: "", percent: 11),
                                Charts(month: "", percent: 10),
                                Charts(month: "", percent: 9),
                                Charts(month: "", percent: 8),
                                Charts(month: "", percent: 7),
                                Charts(month: "", percent: 6),
                                Charts(month: "", percent: 5),
                                Charts(month: "", percent: 4),
                                Charts(month: "", percent: 3),
                                Charts(month: "", percent: 2),
                                Charts(month: "", percent: 1),
                                Charts(month: "", percent: 0)]
    
    let myCharts = MyChart()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bai 6"
        myCharts.frame = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        myCharts.dataSource = self
        view.addSubview(myCharts)
    }
}

extension Bai6ViewController: MyChartDataSource {
    func chartDataValue(_ view: MyChart) -> [Charts] {
        return unitsSoldData
    }
    
    func chartDataPercent(_ view: MyChart) -> [Charts] {
        return unitsSoldPercent
    }
}
