//
//  Bai5ViewController.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/19/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Bai5ViewController: UIViewController {
    struct Config {
        static let chartWidth = UIScreen.main.bounds.width
        static let chartHeight = UIScreen.main.bounds.height - 90
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let columnCharts = columnChart(frame: CGRect(x: 0, y: 90, width: Config.chartWidth, height: Config.chartHeight))
        view.addSubview(columnCharts)
    }
    
    func columnChart(frame: CGRect) -> UIView {
        let chartBig = UIView(frame: frame)
        chartBig.backgroundColor = UIColor(red: 188 / 255, green: 195 / 255, blue: 199 / 255, alpha: 1)
        
        return chartBig
    }
}
