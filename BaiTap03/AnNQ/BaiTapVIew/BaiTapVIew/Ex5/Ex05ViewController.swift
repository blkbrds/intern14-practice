//
//  Ex05ViewController.swift
//  BaiTapVIew
//
//  Created by MBA0217 on 8/14/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

struct BarChart {
    var month : String
    var value : [Float]
    
    init(_ month : String,_ value: [Float]){
        self.month = month
        self.value = value
    }
}

class Ex05ViewController: UIViewController {

    var monthList: [BarChart] = [
        BarChart("Jan", [20.0, 4.0]),
        BarChart("Mar", [6.0, 3.0]),
        BarChart("May", [12.0, 16.0]),
        BarChart("Jul", [4.0, 18.0]),
        BarChart("Sep", [2.0, 4.0]),
        BarChart("Nov", [5.0, 4.0] ),
    ]
    let widthWrapper: CGFloat = UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 19 / 100)
    let heightWrapper: CGFloat = UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 27 / 100)
    let xWrapper: CGFloat = UIScreen.main.bounds.width * 9 / 100
    let yWrapper: CGFloat = UIScreen.main.bounds.height * 11 / 100
    var frame: CGRect {
        return CGRect(x: xWrapper, y: yWrapper, width: widthWrapper, height: heightWrapper)
    }
    let size = UIScreen.main.bounds.width * 2.5 / 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)

        showChart(frame: frame)

        // Do any additional setup after loading the view.
    }
    
    
    func addLabel (container: UIView) {
        var i = 0.0
//        var y: CGFloat = UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 17.5 / 100)
        var y: CGFloat = heightWrapper + yWrapper - 10
        let partSize = heightWrapper / 5.5
        let x: CGFloat = UIScreen.main.bounds.width - 28
        var yAxis: CGFloat = heightWrapper
        var xAxis: CGFloat = 0
        
        while(i <= 20.0) {
            // Add left label
            let leftLabel = UILabel(frame: CGRect(x: 10, y: y, width: 30, height: 20))
            leftLabel.text = "\(i)"
            leftLabel.font = UIFont(name: leftLabel.font.fontName, size: size)

            // Add right label
            let rightLabel = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 20))
            rightLabel.text = "\(i)"
            rightLabel.font = UIFont(name: rightLabel.font.fontName, size: size)
            i += 4.0
            
            if i == 0.0 {
              y = y - yWrapper - partSize
            } else {
                y -= partSize
                
                let xAxisLabel = UILabel(frame: CGRect(x: 0, y: yAxis, width: widthWrapper, height: 1))
                xAxisLabel.backgroundColor = UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)
                container.addSubview(xAxisLabel)
                yAxis -= partSize
            }
            
            let yAxisLabel = UILabel(frame: CGRect(x: xAxis, y: 0, width: 1, height: heightWrapper))
            yAxisLabel.backgroundColor = UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)
            container.addSubview(yAxisLabel)
            xAxis += widthWrapper / 6
            
            view.addSubview(leftLabel)
            view.addSubview(rightLabel)
        }
    }
    
    func columnsChart (container: UIView) {
        // Add months
        var xMonth: CGFloat = xWrapper
        let yMonth: CGFloat = heightWrapper + yWrapper
        for val in monthList {
            let monthLabel = UILabel(frame: CGRect(x: xMonth + 2, y: yMonth, width: 30, height: 20))
            monthLabel.text = "\(val.month)"
            monthLabel.font = UIFont(name: monthLabel.font.fontName, size: size)
            view.addSubview(monthLabel)
            xMonth += widthWrapper / 6
        }
        
        xMonth = 0
        for val in monthList {
            for number in val.value {
                let height: CGFloat = -((heightWrapper / 5.5) * CGFloat(number / 4))
                print(height, heightWrapper)
                let columnView = UIView(frame: CGRect(x: xMonth + 2, y: heightWrapper, width: widthWrapper / 12 - 5, height: height))
                columnView.backgroundColor = .orange

                let valueLabel = UILabel(frame: CGRect(x: xMonth + 2, y: heightWrapper - (-height) - 12, width: widthWrapper / 12 - 5, height: 10))
                valueLabel.text = "\(number)"
                valueLabel.font = UIFont(name: valueLabel.font.fontName, size: size)

                container.addSubview(valueLabel)
                container.addSubview(columnView)
                xMonth += widthWrapper / 12
            }
        }
    }
    
    func showChart(frame: CGRect) {
        let container = UIView(frame: frame)
        addLabel(container: container)
        columnsChart(container: container)
//        container.addBorder(side: .bottom, color: UIColor.black)
        container.backgroundColor = .white
        view.addSubview(container)
        
    }

}
