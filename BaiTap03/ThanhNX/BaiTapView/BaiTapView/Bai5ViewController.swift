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
    var unitsSold2: [Charts] = [Charts(month: "", percent: 20),
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
    
    struct Config {
        static let chartWidth = UIScreen.main.bounds.width
        static let chartHeight = UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 10)
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
        
        let noteView = UIView(frame: CGRect(x: 38, y: chartSmall.bounds.height + 45, width: chartSmall.bounds.width / 4, height: 15))
        noteView.backgroundColor = .clear
        
        let noteUIView = UIView(frame: CGRect(x: 0, y: 0, width: noteView.bounds.width / 7, height: noteView.bounds.height))
        noteUIView.backgroundColor = .orange
        noteView.addSubview(noteUIView)
        
        let noteLabel = UILabel(frame: CGRect(x: noteView.bounds.width - (noteView.bounds.width / 7 * 6), y: 0, width: noteView.bounds.width - noteUIView.bounds.height, height: noteView.bounds.height))
        noteLabel.backgroundColor = .clear
        noteLabel.text = "Units Sold"
        noteLabel.textAlignment = .center
        noteLabel.font = UIFont.systemFont(ofSize: 10)
        noteView.addSubview(noteLabel)
        chartBig.addSubview(noteView)
        
        let maxColumnHeight = chartSmall.bounds.height - 45
        
        var xColumn: CGFloat = 1
        var xMonthName: CGFloat = 38
        
        for index in 0..<unitsSold.count {
            let numbers = UILabel(frame: CGRect(x: xColumn, y: chartSmall.bounds.height - maxColumnHeight * CGFloat(unitsSold[index].percent / 20) - 10, width: chartSmall.bounds.width / 13, height: 10))
            numbers.backgroundColor = .clear
            numbers.text = "\(unitsSold[index].percent)"
            numbers.textColor = .black
            numbers.textAlignment = .center
            numbers.font = UIFont.systemFont(ofSize: 10)
            chartSmall.addSubview(numbers)
            
            let columns = UIView(frame: CGRect(x: xColumn, y: chartSmall.bounds.height - maxColumnHeight * CGFloat(unitsSold[index].percent / 20), width: chartSmall.bounds.width / 13, height: maxColumnHeight * CGFloat(unitsSold[index].percent / 20)))
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
        
        var yNumberOutside: CGFloat = 50
        for index2 in 0..<unitsSold2.count {
            let numberOutside = UILabel(frame: CGRect(x: 2, y: yNumberOutside, width: 20, height: 10))
            numberOutside.text = "\(unitsSold2[index2].percent)"
            numberOutside.backgroundColor = .clear
            numberOutside.font = UIFont.systemFont(ofSize: 8)
            numberOutside.textAlignment = .center
            chartBig.addSubview(numberOutside)
            
            let numberOutside2 = UILabel(frame: CGRect(x: chartBig.bounds.width - 22, y: yNumberOutside, width: 20, height: 10))
            numberOutside2.text = "\(unitsSold2[index2].percent)"
            numberOutside2.backgroundColor = .clear
            numberOutside2.font = UIFont.systemFont(ofSize: 8)
            numberOutside2.textAlignment = .center
            chartBig.addSubview(numberOutside2)
            
            yNumberOutside += maxColumnHeight * CGFloat(unitsSold[0].percent / 20) / 20
            
        }
        return chartBig
    }
}
