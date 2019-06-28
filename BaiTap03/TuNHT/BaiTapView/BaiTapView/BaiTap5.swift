//
//  BaiTap5.swift
//  BaiTapView
//
//  Created by PCI0001 on 6/25/19.
//  Copyright © 2019 PCI0001. All rights reserved.
//

import UIKit

class Chart {
    var name = String()
    var value: Float = 0
    
    init(_ name: String, _ value: Float) {
        self.name = name
        self.value = value
    }
    
    static func data() -> [Chart] {
        return [
            Chart("Jan", 20.0),
            Chart("Feb", 4.0),
            Chart("Mar", 6.0),
            Chart("Apr", 3.0),
            Chart("May", 12.0),
            Chart("Jun", 16.0),
            Chart("Jul", 4.0),
            Chart("Aug", 18.0),
            Chart("Sep", 2.0),
            Chart("Oct", 4.0),
            Chart("Nov", 5.0),
            Chart("Dec", 4.0),
        ]
    }
}

class BaiTap5: UIViewController {
    var items: [Chart] = Chart.data()
    
    let container = UIView(frame: CGRect(x: 20, y: 40, width: UIScreen.main.bounds.width - 55, height: UIScreen.main.bounds.height - 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output()
        print(UIScreen.main.bounds.height)
        
    }
    
    func output() {
        container.backgroundColor = .white
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        var x = container.bounds.origin.x
        
        for i in 0..<items.count {
            let frame = CGRect(x: x, y: container.bounds.origin.y, width: 22, height: UIScreen.main.bounds.height - 100)
            addColumnChart(frame: frame, chart: items[i])
            x += 30
        }
        
        view.addSubview(container)
    }
    
    func addColumnChart(frame: CGRect, chart: Chart) {
        let number = frame.height * CGFloat(chart.value / 25)
        
        let column = UIView(frame: CGRect(x: frame.origin.x, y: frame.height - number, width: 22, height: number))
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
}
