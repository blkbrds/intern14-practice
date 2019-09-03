//
//  ChartDatas.swift
//  ExCustomView
//
//  Created by PCI0010 on 8/27/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

protocol MyChartsDataSource: class {
    func chartUnitSold1(_ view: MyCharts) -> [Charts]
    func chartUnitSold2(_ view: MyCharts) -> [Charts]
}

final class MyCharts: UIView {
    
    weak var dataSource: MyChartsDataSource?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        designChart()
    }
    
    func designChart() {
        let resultLabels = resultLabel(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        addSubview(resultLabels)
    }
    
    func resultLabel(frame: CGRect) -> UIView {
        
        let bigView = UIView(frame: frame)
        
        guard let unitSold1 = dataSource?.chartUnitSold1(self) else { return bigView }
        guard let unitSold2 = dataSource?.chartUnitSold2(self) else { return bigView }
        
        bigView.backgroundColor = .clear
        
        let mainView = UILabel(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        mainView.backgroundColor = .lightGray
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.black.cgColor
        bigView.addSubview(mainView)
        
        let mainLabel = UILabel(frame: CGRect(x: 40, y: 60, width: 340, height: 702))
        mainLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainLabel.layer.borderWidth = 2
        mainLabel.layer.borderColor = UIColor.black.cgColor
        mainView.addSubview(mainLabel)
        
        let exxLabel = UILabel(frame: CGRect(x: 40, y: 800, width: 15, height: 15))
        exxLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        exxLabel.layer.borderWidth = 2
        exxLabel.layer.borderColor = UIColor.white.cgColor
        mainView.addSubview(exxLabel)
        
        let exLabel = UILabel(frame: CGRect(x: 50, y: 800, width: 80, height: 15))
        exLabel.backgroundColor = .clear
        exLabel.text = "Units Sold"
        exLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        exLabel.font = exLabel.font.withSize(13)
        exLabel.textAlignment = .right
        mainView.addSubview(exLabel)
        
        var yNumberOutside: CGFloat = 155
        for index1 in 0..<unitSold2.count {
            let numberOut1 = UILabel(frame: CGRect(x: 2,y: yNumberOutside, width: 40, height: 20))
            numberOut1.backgroundColor = .clear
            numberOut1.text = "\(unitSold2[index1].percent)"
            numberOut1.textAlignment = .center
            numberOut1.textColor = .black
            numberOut1.font = numberOut1.font.withSize(12)
            yNumberOutside += (mainLabel.frame.size.height - 100) / 5
            mainView.addSubview(numberOut1)
        }
        
        yNumberOutside = 155
        for index2 in 0..<unitSold2.count {
            let numberOut2 = UILabel(frame: CGRect(x: 375,y: yNumberOutside, width: 40, height: 20))
            numberOut2.backgroundColor = .clear
            numberOut2.text = "\(unitSold2[index2].percent)"
            numberOut2.textAlignment = .center
            numberOut2.textColor = .black
            numberOut2.font = numberOut2.font.withSize(12)
            yNumberOutside += (mainLabel.frame.size.height - 100) / 5
            mainView.addSubview(numberOut2)
            
        }
        
        var x: CGFloat = 2
        for index in 0..<unitSold1.count {
            let subHeight = mainLabel.bounds.height - 100
            let sColumn = subHeight * CGFloat(unitSold1[index].percent) / 20
            let a = mainLabel.bounds.height - sColumn
            let columnView = UILabel(frame: CGRect(x: x, y: a, width: 28, height: sColumn))
            x += 28
            columnView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            columnView.layer.borderWidth = 0.5
            columnView.layer.borderColor = UIColor.white.cgColor
            mainLabel.addSubview(columnView)
        }
        
        let lineChart = UILabel(frame: CGRect(x: 0, y: mainLabel.bounds.height / 2 + 45.5, width: 340, height: 3))
        lineChart.backgroundColor = .red
        lineChart.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lineChart.layer.borderWidth = 1
        mainLabel.addSubview(lineChart)
        
        var z: CGFloat = 2
        for index in 0..<unitSold1.count {
            let subHeight = mainLabel.bounds.height - 100
            let sColumn = subHeight * CGFloat(unitSold1[index].percent) / 20
            let a = mainLabel.bounds.height - sColumn
            let numberLabel = UILabel(frame: CGRect(x: z, y: a - 20, width: 28, height: 20))
            numberLabel.font = numberLabel.font.withSize(10)
            numberLabel.textAlignment = .center
            z += 28
            numberLabel.text = "\(unitSold1[index].percent)"
            mainLabel.addSubview(numberLabel)
        }
        var c: CGFloat = 2
        for index in 0..<unitSold1.count {
            let monthLabel = UILabel(frame: CGRect(x: c, y: mainLabel.bounds.height, width: 28, height: 20))
            monthLabel.font = monthLabel.font.withSize(12)
            monthLabel.textAlignment = .center
            c += 28
            monthLabel.text = "\(unitSold1[index].months)"
            mainLabel.addSubview(monthLabel)
        }
        return bigView
    }
}

class Charts {
    var months:String = ""
    var percent:Float
    
    init(months: String, percent:Float) {
        self.months = months
        self.percent = percent
    }
}
