//
//  Ex06ViewController.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/19/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class Ex06ViewController: UIViewController {
    
    var chartDatas = MyCharts()
    
    var unitSold1: [Charts] = [ Charts(months: "Jan", percent: 20.0),
                                Charts(months: "", percent: 4.0),
                                Charts(months: "Mar", percent: 6.0),
                                Charts(months: "", percent: 3.0),
                                Charts(months: "May", percent: 12.0),
                                Charts(months: "", percent: 16.0),
                                Charts(months: "Jul", percent: 4.0),
                                Charts(months: "", percent: 18.0),
                                Charts(months: "Sep", percent: 2.0),
                                Charts(months: "", percent: 4.0),
                                Charts(months: "Nov", percent: 5.0),
                                Charts(months: "", percent: 4.0), ]
    
    var unitSold2: [Charts] = [ Charts(months: "", percent: 20.0),
                                Charts(months: "", percent: 16),
                                Charts(months: "", percent: 12),
                                Charts(months: "", percent: 8.0),
                                Charts(months: "", percent: 4.0),
                                Charts(months: "", percent: 0.0) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        chartDatas.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        chartDatas.dataSource = self
        view.addSubview(chartDatas)
    }
    
    func configUI() {
        title = " Ex06 "
        navigationController?.navigationBar.backgroundColor = .cyan
    }
}

extension Ex06ViewController: MyChartsDataSource {
    func chartUnitSold1(_ view: MyCharts) -> [Charts] {
        return unitSold1
    }
    
    func chartUnitSold2(_ view: MyCharts) -> [Charts] {
        return unitSold2
    }
}
