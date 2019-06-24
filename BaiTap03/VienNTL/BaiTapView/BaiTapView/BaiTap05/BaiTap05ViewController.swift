//
//  BaiTap05ViewController.swift
//  BaiTapView
//
//  Created by Nguyen Truong Lam Vien on 6/20/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class Chart {
    var name = String()
    var value: Float = 0
    
    init(_ name: String, _ value: Float) {
        self.name = name
        self.value = value
    }
    
    // Dummy Data for test
    static func dummyData() -> [Chart] {
        return [
            Chart("Jan", 20.0),
            Chart("Feb", 90.0),
            Chart("Mar", 16.0),
            Chart("Apr", 23.0),
            Chart("May", 2.0),
            Chart("Jun", 13.0),
            Chart("Jul", 8.0),
            Chart("Aug", 9.0),
            Chart("Sep", 10.0),
            Chart("Oct", 5.0),
            Chart("Nov", 7.0),
            Chart("Dec", 8.0),
        ]
    }
}

class BaiTap05ViewController: UIViewController {
    
    var items: [Chart] = Chart.dummyData()
    
    var containerView = UIView(frame: CGRect(x: 40, y: 40, width: UIScreen.main.bounds.width - 45, height: UIScreen.main.bounds.height - 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output()
        print(UIScreen.main.bounds.height)
        
    }
    
    func output() {
        containerView.backgroundColor = .white
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        var x = containerView.bounds.origin.x
        
        for index in 0..<items.count {
            let frame = CGRect(x: x,
                               y: containerView.bounds.origin.y,
                               width: 22,
                               height: UIScreen.main.bounds.height - 100)
            
            addColumnChart(frame: frame,
                           chart: items[index])
            
            x += 28
        }
        
        view.addSubview(containerView)
    }
    
    func addColumnChart(frame: CGRect, chart: Chart) {
        let number = frame.height * CGFloat(chart.value / 100)
        
        let column = UIView(frame: CGRect(x: frame.origin.x, y: frame.height - number, width: 22, height: number))
        column.backgroundColor = .orange
        containerView.addSubview(column)
        
        let nameLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.height + 8, width: 20, height: 20))
        nameLabel.text = chart.name
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        containerView.addSubview(nameLabel)
        
        let valueLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.height - number - 15, width: 20, height: 20))
        valueLabel.text = "\(chart.value)"
        valueLabel.textColor = .black
        valueLabel.textAlignment = .center
        valueLabel.font = UIFont.systemFont(ofSize: 8)
        containerView.addSubview(valueLabel)

    }
}
