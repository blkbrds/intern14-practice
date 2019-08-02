//
//  ChartView.swift
//  Custom View
//
//  Created by PCI0007 on 8/1/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

protocol ChartViewDataSource: class {
    func arraysOfMonths() -> [MonthWithValue]
}

class ChartView: UIView {

    let board1 = UIView(frame: CGRect(x: 40, y: 100, width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height - 200))
    weak var dataSource: ChartViewDataSource?
 
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupBoard()
    }
    
    private func setupBoard() {
        guard let monthLists = dataSource?.arraysOfMonths() else { return }
        board1.backgroundColor = .white
        board1.layer.borderWidth = 1
        board1.layer.borderColor = UIColor.black.cgColor
        addSubview(board1)
        var y1: CGFloat = 125.0
        var b: CGFloat = 20.0
        var x3: CGFloat = 2.5
        var y3: CGFloat = 50
        var x: CGFloat = 2.5
        var y: CGFloat = 0
        var x2: CGFloat = board1.frame.origin.x + 2.5
        for i in 0..<monthLists.count {
            let soldValue = UILabel(frame: CGRect(x: 5.0, y: y1, width: 50, height: 50))
            soldValue.font = .systemFont(ofSize: 15)
            soldValue.text = "\(b)"
            y1 += ((board1.bounds.height - 50) / 5)
            b -= 4
            soldValue.textColor = .black
            addSubview(soldValue)
            let monthValue = UILabel(frame: CGRect(x: x2, y: board1.frame.maxY - 2, width: 50, height: 50))
            monthValue.font = .systemFont(ofSize: 15)
            monthValue.text = "\(monthLists[i].months)"
            monthValue.textColor = .black
            x2 +=  ((board1.bounds.width / CGFloat(monthLists.count)) + 5)
            y3 =  board1.bounds.height - (((board1.bounds.height - 50) / 20) * monthLists[i].unitSold)
            let column = UIView(frame: CGRect(x: x3, y: y3, width: ((board1.bounds.width / CGFloat(monthLists.count)) - 5 * (CGFloat(monthLists.count) + 1)) , height: ((board1.bounds.height - 50) / 20) * monthLists[i].unitSold ))
            column.backgroundColor = .orange
            column.layer.borderWidth = 1
            column.layer.borderColor = UIColor.black.cgColor
            x3 += ((board1.bounds.width / CGFloat(monthLists.count)) + 5)
            board1.addSubview(column)
            y = board1.bounds.height - (((board1.bounds.height - 50) / 20) * monthLists[i].unitSold) - 30
            let monthlable = UILabel(frame: CGRect(x: x, y: y, width: 40, height: 40))
            x += ((board1.bounds.width / CGFloat(monthLists.count)) + 5)
            monthlable.text = "\(monthLists[i].unitSold)"
            monthlable.font = .systemFont(ofSize: 15)
            monthlable.textColor = .black
            board1.addSubview(monthlable)
            addSubview(monthValue)
        }
    }
}
