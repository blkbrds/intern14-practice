//
//  Bai5ViewController.swift
//  BaiTapView
//
//  Created by PCI0008 on 6/19/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

class Charts {
    var month: String
    var percent: Float
    
    init(month: String, percent: Float) {
        self.month = month
        self.percent = percent
    }
}

class Bai5ViewController: UIViewController {
    
    var unitsSold: [Charts] = [
        Charts(month: "Jan", percent: 20.0),
        Charts(month: "Feb", percent: 4.0),
        Charts(month: "Mar", percent: 6.0),
        Charts(month: "Apr", percent: 3.0),
        Charts(month: "May", percent: 12.0),
        Charts(month: "Jun", percent: 16.0),
        Charts(month: "July", percent: 4.0),
        Charts(month: "Aug", percent: 16.0),
        Charts(month: "Sep", percent: 2.0),
        Charts(month: "Oct", percent: 4.0),
        Charts(month: "Nov", percent: 5.0),
        Charts(month: "Dec", percent: 4.0)  ]

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
        
        let chartSmall = UIView(frame: CGRect(x: 35, y: 10, width: chartBig.bounds.width - 70, height: chartBig.bounds.height - 80))
        chartSmall.backgroundColor = .white
        chartBig.addSubview(chartSmall)
        
//        let whiteView = UIView(frame: CGRect(x: 0, y: 0, width: chartSmall.bounds.width, height: chartSmall.bounds.height))
//        whiteView.backgroundColor = .white
//        chartSmall.addSubview(whiteView)
        
        let maxColumnHeight = chartSmall.bounds.height - 45
        
        var xColumn: CGFloat = 1
        var yColumn: CGFloat = 45
        var xMonthName: CGFloat = 38
        for index in 0..<unitsSold.count {
            let columns = UIView(frame: CGRect(x: xColumn, y: yColumn, width: chartSmall.bounds.width / 13, height: maxColumnHeight * CGFloat(unitsSold[index].percent / 20)))
            columns.backgroundColor = .orange
            chartSmall.addSubview(columns)
            xColumn += chartSmall.bounds.width / 12
            
            let monthName = UILabel(frame: CGRect(x: xMonthName, y: 20 + chartSmall.bounds.height, width: (chartBig.bounds.width - 72) / 13, height: 20))
            monthName.text = unitsSold[index].month
            monthName.textColor = .black
            monthName.font = UIFont.systemFont(ofSize: 10)
            chartBig.addSubview(monthName)
            xMonthName += chartSmall.bounds.width / 12
        }
        
        return chartBig
    }
}
