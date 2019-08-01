//
//  MyChartView.swift
//  BaiTapCustomView
//
//  Created by PCI0001 on 7/31/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

protocol MyChartViewDataSource {
    func nameAndValueOfChart() -> [Chart]
    func numberOfColumns() -> Int
}

class MyChartView: UIView {
    var dataSource: MyChartViewDataSource?
    let container = UIView(frame: CGRect(x: 20, y: UIScreen.main.bounds.height / 10, width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 150))
    
    func addColumnChart(frame: CGRect, chart: Chart) {
        let number = frame.height * CGFloat(chart.value / 25)
        
        guard let columns = dataSource?.numberOfColumns() else { return }
        let column = UIView(frame: CGRect(x: frame.origin.x, y: frame.height - number, width: container.bounds.width / CGFloat(columns) - 5, height: number))
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
        container.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        var x = container.bounds.origin.x + 5
        
        guard let charts = dataSource?.nameAndValueOfChart() else { return }
        guard let columns = dataSource?.numberOfColumns() else { return }
        for i in 0..<columns {
            let frame = CGRect(x: x, y: container.bounds.origin.y, width: 0, height: container.frame.size.height)
            addColumnChart(frame: frame, chart: charts[i])
            x += 30
        }
        addSubview(container)
    }
    
}
