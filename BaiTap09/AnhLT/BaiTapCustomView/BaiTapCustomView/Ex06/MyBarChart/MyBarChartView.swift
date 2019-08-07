//
//  MyBarChartView.swift
//  BaiTapCustomView
//
//  Created by PCI0013 on 8/6/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

protocol MyBarChartDataSource: class {
    func nameAndValue() -> [Chart]
    func columnNumber() -> Int
}

class MyBarChartView: UIView {
    
    weak var dataSource: MyBarChartDataSource?
    let container = UIView(frame: CGRect(x: 20, y: 40, width: UIScreen.main.bounds.width - 55, height: UIScreen.main.bounds.height - 100))

    func addColumnChart(frame: CGRect, chart: Chart) {
        let number = frame.height * CGFloat(chart.value / 25)
        
        let column = UIView(frame: CGRect(x: frame.origin.x + 4, y: frame.height - number, width: 22, height: number))
        column.backgroundColor = .orange
        container.addSubview(column)
        
        let nameLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.height + 8, width: 20, height: 20))
        nameLabel.text = chart.name
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        container.addSubview(nameLabel)
        
        let valueLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.height - number - 15, width: 20, height: 20))
        valueLabel.text = "\(chart.value)"
        valueLabel.textColor = .black
        valueLabel.textAlignment = .center
        valueLabel.font = UIFont.systemFont(ofSize: 8)
        container.addSubview(valueLabel)
    }
    
    func output() {
        container.backgroundColor = .white
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        var x = container.bounds.origin.x
        
        guard let charts = dataSource?.nameAndValue() else {return}
        guard let columns = dataSource?.columnNumber() else {return}
        
        for i in 0..<columns {
            let frame = CGRect(x: x, y: container.bounds.origin.y, width: 22, height: UIScreen.main.bounds.height - 100)
            addColumnChart(frame: frame, chart: charts[i] )
            x += 30
        }
        addSubview(container)
    }
}

