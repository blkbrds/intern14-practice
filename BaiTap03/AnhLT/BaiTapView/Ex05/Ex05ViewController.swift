//
//  Ex05ViewController.swift
//  BaiTapView
//
//  Created by PCI0013 on 6/25/19.
//  Copyright © 2019 PCI0013. All rights reserved.
//

import UIKit

class BarChart {
    var month : String
    var value : Float
    init(_ month : String,_ value: Float){
        self.month = month
        self.value = value
    }
}

class Ex05ViewController: UIViewController {
    
    let containerView = UIView()
    var monthList: [BarChart] = [BarChart("Jan", 20.0),
                             BarChart("Feb", 4.0),
                             BarChart("Mar", 6.0),
                             BarChart("Apr", 3.0),
                             BarChart("May", 12.0),
                             BarChart("Jun", 16.0),
                             BarChart("Jul", 4.0),
                             BarChart("Aug", 18.0),
                             BarChart("Sep", 2.0),
                             BarChart("Oct", 4.0),
                             BarChart("Nov", 5.0),
                             BarChart("Dec", 4.0)]
     let frame = CGRect(x: 30, y: 80, width: 355, height: 700)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 30, y: 80, width: 355, height: 700)
        configContainerView(frame)
        addBarChart()
    }
    
    func configContainerView(_ frame: CGRect) {
        containerView.frame = frame
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.cgColor
        view.addSubview(containerView)
    }
    
    func addBarChart() {
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        for i in 0..<monthList.count {
            y = 700 - containerView.bounds.height * CGFloat(monthList[i].value) / 20

            let frame = CGRect(x: x, y: y , width: 25, height: containerView.bounds.height * CGFloat(monthList[i].value) / 20)
            let barChart = UIView(frame: frame)
            barChart.backgroundColor = .orange
            barChart.layer.borderWidth = 1
            barChart.layer.borderColor = UIColor.black.cgColor
            containerView.addSubview(barChart)
            x += 30
           
            let nameLabel = UILabel(frame: CGRect(x: frame.origin.x, y: 700, width: 20, height: 20))
            nameLabel.text = monthList[i].month
            nameLabel.textColor = .black
            nameLabel.textAlignment = .center
            nameLabel.font = UIFont.systemFont(ofSize: 10)
            containerView.addSubview(nameLabel)
            
            let valueLabel = UILabel(frame: CGRect(x: frame.origin.x, y: y - 20 , width: 30, height: 20))
            valueLabel.text = "\(monthList[i].value)"
            valueLabel.textColor = .black
            valueLabel.textAlignment = .center
            valueLabel.font = UIFont.systemFont(ofSize: 10)
            containerView.addSubview(valueLabel)
        }
    }
}
