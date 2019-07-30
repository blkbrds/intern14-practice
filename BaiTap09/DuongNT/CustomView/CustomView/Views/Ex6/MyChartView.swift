//
//  MyChartView.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/29/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyChartViewDataSource: class {
    func numberOfColumn(myChart: MyChartView) -> Int
    func nameOfColumn(myChart: MyChartView) -> String
    func valueOfColumn(myChart: MyChartView) -> Float
}

class MyChartView: UIView {
    
    weak var dataSource: MyChartViewDataSource? {
        didSet {
            setUpChart()
        }
    }
    var unitsSold: [Charts] = [
        Charts(month: "Jan", percent: 20.0),
        Charts(month: "Feb", percent: 4.0),
        Charts(month: "Mar", percent: 6.0),
        Charts(month: "Apr", percent: 3.0),
        Charts(month: "May", percent: 12.0),
        Charts(month: "Jun", percent: 16.0),
        Charts(month: "Jul", percent: 4.0),
        Charts(month: "Aug", percent: 16.0),
        Charts(month: "Sep", percent: 2.0),
        Charts(month: "Oct", percent: 4.0),
        Charts(month: "Nov", percent: 5.0),
        Charts(month: "Dec", percent: 4.0)  ]
    var unitsSold2: [Charts] = [Charts(month: "", percent: 20),
                                Charts(month: "", percent: 16),
                                Charts(month: "", percent: 12),
                                Charts(month: "", percent: 8),
                                Charts(month: "", percent: 4),
                                Charts(month: "", percent: 0)]
    
    struct Config {
        static let chartWidth = UIScreen.main.bounds.width
        static let chartHeight = UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 10)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setUpChart() {
        let columnCharts = columnChart(frame: CGRect(x: 0, y: 90, width: Config.chartWidth, height: Config.chartHeight))
        addSubview(columnCharts)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:s) has not been implemented")
    }
    func columnChart(frame: CGRect) -> UIView {
        
        let chartBig = UIView(frame: frame)
        guard let numberOfColumn = dataSource?.numberOfColumn(myChart: self) else {
            return chartBig
        }
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
        
        for index in 0..<numberOfColumn {
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
            xColumn += chartSmall.bounds.width / CGFloat(numberOfColumn)
            
            if index % 2 == 0 {
                let monthName = UILabel(frame: CGRect(x: xMonthName, y: 20 + chartSmall.bounds.height, width: (chartBig.bounds.width - 72) / 13, height: 20))
                monthName.text = unitsSold[index].month
                monthName.textColor = .black
                monthName.font = UIFont.systemFont(ofSize: 10)
                chartBig.addSubview(monthName)
            }
            xMonthName += chartSmall.bounds.width / CGFloat(numberOfColumn)
            
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
            
            yNumberOutside += maxColumnHeight * CGFloat(unitsSold[0].percent / 20) / 5
            
        }
        return chartBig
    }
}
