//
//  BaiTap05ViewController.swift
//  BaiTapView
//
//  Created by Nguyen Truong Lam Vien on 6/20/19.
//  Copyright © 2019 Nguyen Truong Lam Vien. All rights reserved.
//

import UIKit

class ValueChart {
    var name = String()
    var value: Float = 0
    
    init(_ name: String, _ value: Float) {
        self.name = name
        self.value = value
    }
}

class BaiTap05ViewController: UIViewController {
    
    var valueChart: [ValueChart] = [
        ValueChart("Jan", 20.0),
        ValueChart("Feb", 30.0),
        ValueChart("Mar", 16.0),
        ValueChart("Apr", 23.0),
        ValueChart("May", 2.0),
        ValueChart("Jun", 13.0),
        ValueChart("Jul", 8.0),
        ValueChart("Aug", 9.0),
        ValueChart("Sep", 10.0),
        ValueChart("Oct", 5.0),
        ValueChart("Nov", 7.0),
        ValueChart("Dec", 8.0),
        ]
    var containerSuperView = UIView(frame: CGRect(x: 40, y: 40, width: UIScreen.main.bounds.width - 45, height: UIScreen.main.bounds.height - 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output()
        print(UIScreen.main.bounds.height)
        
    }
    
    func output() {
        containerSuperView.backgroundColor = .white
        containerSuperView.layer.borderWidth = 1
        containerSuperView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

        var x = containerSuperView.bounds.origin.x
        
        for index in 0..<valueChart.count {
            let frame = CGRect(x: x, y: containerSuperView.bounds.origin.y, width: 22 , height: UIScreen.main.bounds.height - 100)
            addColumnChart(frame, valueChart[index].name, valueChart[index].value)
            x += 28
        }
        
        view.addSubview(containerSuperView)
    }
    
    func addColumnChart(_ frame: CGRect, _ name: String, _ value: Float) {
        let number = UIScreen.main.bounds.height * CGFloat(value / 100)
        let column = UIView(frame: CGRect(x: frame.origin.x, y: frame.height - number, width: 22, height: number))
        column.backgroundColor = .orange
        containerSuperView.addSubview(column)
        
        let nameLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.height + 8, width: 20, height: 20))
        nameLabel.text = name
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        containerSuperView.addSubview(nameLabel)
        
        let valueLabel = UILabel(frame: CGRect(x: frame.origin.x, y: frame.height - number - 15, width: 20, height: 20))
        valueLabel.text = "\(value)"
        valueLabel.textColor = .black
        valueLabel.textAlignment = .center
        valueLabel.font = UIFont.systemFont(ofSize: 8)
        containerSuperView.addSubview(valueLabel)

    }
}
