//
//  BaiTap5ViewController.swift
//  btView1
//
//  Created by PCI0010 on 7/23/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

class BaiTap5ViewController: UIViewController {
    var unitSold1: [DataCharts] = [ DataCharts(months: "Jan", percent: 20.0),
                                    DataCharts(months: "", percent: 4.0),
                                    DataCharts(months: "Mar", percent: 6.0),
                                    DataCharts(months: "", percent: 3.0),
                                    DataCharts(months: "May", percent: 12.0),
                                    DataCharts(months: "", percent: 16.0),
                                    DataCharts(months: "Jul", percent: 4.0),
                                    DataCharts(months: "", percent: 18.0),
                                    DataCharts(months: "Sep", percent: 2.0),
                                    DataCharts(months: "", percent: 4.0),
                                    DataCharts(months: "Nov", percent: 5.0),
                                    DataCharts(months: "", percent: 4.0), ]
    
    var unitSold2: [DataCharts] = [ DataCharts(months: "", percent: 20.0),
                                    DataCharts(months: "", percent: 16),
                                    DataCharts(months: "", percent: 12),
                                    DataCharts(months: "", percent: 8.0),
                                    DataCharts(months: "", percent: 4.0),
                                    DataCharts(months: "", percent: 0.0) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel()
    }
    
    func resultLabel() {
        let mainView = UILabel(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        mainView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(mainView)
        
        let mainLabel = UILabel(frame: CGRect(x: 40, y: 70, width: 340, height: 702))
        mainLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainLabel.layer.borderWidth = 2
        mainLabel.layer.borderColor = UIColor.black.cgColor
        view.addSubview(mainLabel)
        
        let exxLabel = UILabel(frame: CGRect(x: 40, y: 800, width: 15, height: 15))
        exxLabel.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        exxLabel.layer.borderWidth = 2
        exxLabel.layer.borderColor = UIColor.white.cgColor
        view.addSubview(exxLabel)
        
        let exLabel = UILabel(frame: CGRect(x: 40, y: 800, width: 80, height: 15))
        exLabel.backgroundColor = .clear
        exLabel.text = "Units Sold"
        exLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        exLabel.font = exLabel.font.withSize(13)
        exLabel.textAlignment = .right
        view.addSubview(exLabel)
        
        var yNumberOutside: CGFloat = 155
        for index1 in 0..<unitSold2.count {
            let numberOut1 = UILabel(frame: CGRect(x: 2,y: yNumberOutside, width: 40, height: 20))
            numberOut1.backgroundColor = .clear
            numberOut1.text = "\(unitSold2[index1].percent)"
            numberOut1.textAlignment = .center
            numberOut1.textColor = .black
            numberOut1.font = numberOut1.font.withSize(12)
            yNumberOutside += (mainLabel.frame.size.height - 100) / 5
            view.addSubview(numberOut1)
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
            view.addSubview(numberOut2)
            
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
        
    }
    
}
class DataCharts {
    var months:String = ""
    var percent:Float
    init(months: String, percent:Float) {
        self.months = months
        self.percent = percent
    }
}


