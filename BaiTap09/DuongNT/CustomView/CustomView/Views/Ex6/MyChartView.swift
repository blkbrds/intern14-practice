//
//  MyChartView.swift
//  CustomView
//
//  Created by Nguyen Duong on 7/29/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

protocol MyChartViewDataSource: class {

    func numberOfColumn() -> Int
    func nameOfColumn(titleForRow row: Int) -> String
    func valueOfColumn(titleForRow row: Int) -> Float
    func maxValueOfHeight() -> Int
}

class MyChartView: UIView {

    // MARK - Properties
    weak var dataSource: MyChartViewDataSource? {
        didSet {
            setUpChart()
        }
    }

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
        guard let numberOfColumn = dataSource?.numberOfColumn(), let maxValueOfHeight = dataSource?.maxValueOfHeight() else {
            return chartBig
        }
        let max = maxValueOfHeight - maxValueOfHeight % 4
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
            guard let nameOfColumn = dataSource?.nameOfColumn(titleForRow: index), let valueOfColumn = dataSource?.valueOfColumn(titleForRow: index) else {
                return chartBig
            }
            let numbers = UILabel(frame: CGRect(x: xColumn, y: chartSmall.bounds.height - maxColumnHeight * CGFloat(valueOfColumn / Float(max)) - 10, width: chartSmall.bounds.width / 13, height: 10))
            numbers.backgroundColor = .clear
            numbers.text = "\(valueOfColumn)"
            numbers.textColor = .black
            numbers.textAlignment = .center
            numbers.font = UIFont.systemFont(ofSize: 10)
            chartSmall.addSubview(numbers)
            let columns = UIView(frame: CGRect(x: xColumn, y: chartSmall.bounds.height - maxColumnHeight * CGFloat(valueOfColumn / Float(max)), width: chartSmall.bounds.width / 13, height: maxColumnHeight * CGFloat(valueOfColumn / Float(max))))
            columns.backgroundColor = .orange
            chartSmall.addSubview(columns)
            xColumn += chartSmall.bounds.width / CGFloat(numberOfColumn)
            if index % 2 == 0 {
                let monthName = UILabel(frame: CGRect(x: xMonthName, y: 20 + chartSmall.bounds.height, width: (chartBig.bounds.width - 72) / 13, height: 20))
                monthName.text = nameOfColumn
                monthName.textColor = .black
                monthName.font = UIFont.systemFont(ofSize: 10)
                chartBig.addSubview(monthName)
            }
            xMonthName += chartSmall.bounds.width / CGFloat(numberOfColumn)
        }
        var jumbY = max
        var yNumberOutside: CGFloat = 50
        for _ in 0..<maxValueOfHeight {
            guard let valueOfColumn = dataSource?.valueOfColumn(titleForRow: 0) else {
                return chartBig
            }
            let numberOutside = UILabel(frame: CGRect(x: 2, y: yNumberOutside, width: 20, height: 10))
            numberOutside.text = "\(jumbY)"
            numberOutside.backgroundColor = .clear
            numberOutside.font = UIFont.systemFont(ofSize: 8)
            numberOutside.textAlignment = .center
            chartBig.addSubview(numberOutside)
            let numberOutside2 = UILabel(frame: CGRect(x: chartBig.bounds.width - 22, y: yNumberOutside, width: 20, height: 10))
            numberOutside2.text = "\(jumbY)"
            numberOutside2.backgroundColor = .clear
            numberOutside2.font = UIFont.systemFont(ofSize: 8)
            numberOutside2.textAlignment = .center
            chartBig.addSubview(numberOutside2)
            yNumberOutside += maxColumnHeight * CGFloat(valueOfColumn / Float(max)) / 5
            jumbY -= max / 5
        }
        return chartBig
    }
}
