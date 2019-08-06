//
//  MyChart.swift
//  CustomView
//
//  Created by PCI0008 on 7/31/19.
//  Copyright © 2019 PCI0008. All rights reserved.
//

import UIKit

protocol MyChartDataSource: class {
    func chartDataValue(_ view: MyChart) -> [Charts]
    func chartDataPercent(_ view: MyChart) -> [Charts]
}

final class MyChart: UIView {
    
    weak var dataSource: MyChartDataSource?
    
    struct Config {
        static let chartWidth = UIScreen.main.bounds.width
        static let chartHeight = UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 10)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        designChart()
    }
    
    func designChart() {
        let columnCharts = columnChart(frame: CGRect(x: 0, y: 90, width: Config.chartWidth, height: Config.chartHeight))
        addSubview(columnCharts)
    }
    
    func columnChart(frame: CGRect) -> UIView {
        
        let chartBig = UIView(frame: frame)
        
        guard let dataCharts = dataSource?.chartDataValue(self) else { return chartBig }
        guard let dataPercent = dataSource?.chartDataPercent(self) else { return chartBig }
        
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
        
        for index in 0..<dataCharts.count {
            let numbers = UILabel(frame: CGRect(x: xColumn, y: chartSmall.bounds.height - maxColumnHeight * CGFloat(dataCharts[index].percent / 20) - 10, width: chartSmall.bounds.width / CGFloat(dataCharts.count + 1), height: 10))
            numbers.backgroundColor = .clear
            numbers.text = "\(dataCharts[index].percent)"
            numbers.textColor = .black
            numbers.textAlignment = .center
            numbers.font = UIFont.systemFont(ofSize: 10)
            chartSmall.addSubview(numbers)
            
            let columns = UIView(frame: CGRect(x: xColumn, y: chartSmall.bounds.height - maxColumnHeight * CGFloat(dataCharts[index].percent / 20), width: chartSmall.bounds.width / CGFloat(dataCharts.count + 1), height: maxColumnHeight * CGFloat(dataCharts[index].percent / 20)))
            columns.backgroundColor = .orange
            chartSmall.addSubview(columns)
            xColumn += chartSmall.bounds.width / CGFloat(dataCharts.count)
            
            let monthName = UILabel(frame: CGRect(x: xMonthName, y: 20 + chartSmall.bounds.height, width: (chartBig.bounds.width - 72) / CGFloat(dataCharts.count + 1), height: 20))
            monthName.text = dataCharts[index].month
            monthName.textColor = .black
            monthName.font = UIFont.systemFont(ofSize: 10)
            chartBig.addSubview(monthName)
            xMonthName += chartSmall.bounds.width / CGFloat(dataCharts.count)
            
        }
        
        var yNumberOutside: CGFloat = 50
        for index2 in 0..<dataPercent.count {
            let numberOutside = UILabel(frame: CGRect(x: 2, y: yNumberOutside, width: 20, height: 10))
            numberOutside.text = "\(dataPercent[index2].percent)"
            numberOutside.backgroundColor = .clear
            numberOutside.font = UIFont.systemFont(ofSize: 8)
            numberOutside.textAlignment = .center
            chartBig.addSubview(numberOutside)
            
            let numberOutside2 = UILabel(frame: CGRect(x: chartBig.bounds.width - 22, y: yNumberOutside, width: 20, height: 10))
            numberOutside2.text = "\(dataPercent[index2].percent)"
            numberOutside2.backgroundColor = .clear
            numberOutside2.font = UIFont.systemFont(ofSize: 8)
            numberOutside2.textAlignment = .center
            chartBig.addSubview(numberOutside2)
            
            yNumberOutside += maxColumnHeight * CGFloat(dataCharts[0].percent / 20) / 20            
        }
        return chartBig
    }
}
