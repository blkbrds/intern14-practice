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
    let widthFrame: CGFloat = UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 19 / 100)
    let heightFrame: CGFloat = UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 27 / 100)
    let xFrame: CGFloat = UIScreen.main.bounds.width * 9 / 100
    let yFrame: CGFloat = UIScreen.main.bounds.height * 11 / 100
    var frame: CGRect {
        return CGRect(x: xFrame, y: yFrame, width: widthFrame, height: heightFrame)
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
        var y: CGFloat = heightFrame + yFrame - 10
        let partSize = heightFrame / 5.5
        let x: CGFloat = UIScreen.main.bounds.width - 28
        var yAxis: CGFloat = heightFrame
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
              y = y - yFrame - partSize
            } else {
                y -= partSize
                
                let xAxisLabel = UILabel(frame: CGRect(x: 0, y: yAxis, width: widthFrame, height: 1))
                xAxisLabel.backgroundColor = UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)
                container.addSubview(xAxisLabel)
                yAxis -= partSize
            }
            
            let yAxisLabel = UILabel(frame: CGRect(x: xAxis, y: 0, width: 1, height: heightFrame))
            yAxisLabel.backgroundColor = UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)
            container.addSubview(yAxisLabel)
            xAxis += widthFrame / 6
            
            view.addSubview(leftLabel)
            view.addSubview(rightLabel)
        }
    }
    
    func columnsChart (container: UIView) {
        // Add months
        var xMonth: CGFloat = xFrame
        let yMonth: CGFloat = heightFrame + yFrame
        for val in monthList {
            let monthLabel = UILabel(frame: CGRect(x: xMonth + 2, y: yMonth, width: 30, height: 20))
            monthLabel.text = "\(val.month)"
            monthLabel.font = UIFont(name: monthLabel.font.fontName, size: size)
            view.addSubview(monthLabel)
            xMonth += widthFrame / 6
        }
        
        xMonth = 0
        for val in monthList {
            for number in val.value {
                let height: CGFloat = -((heightFrame / 5.5) * CGFloat(number / 4))
                print(height, heightFrame)
                let columnView = UIView(frame: CGRect(x: xMonth + 2, y: heightFrame, width: widthFrame / 12 - 5, height: height))
                columnView.backgroundColor = .orange

                let valueLabel = UILabel(frame: CGRect(x: xMonth + 2, y: heightFrame - (-height) - 12, width: widthFrame / 12 - 5, height: 10))
                valueLabel.text = "\(number)"
                valueLabel.font = UIFont(name: valueLabel.font.fontName, size: size)

                container.addSubview(valueLabel)
                container.addSubview(columnView)
                xMonth += widthFrame / 12
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
