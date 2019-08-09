//
//  Ex05ViewController.swift
//  BaiTapView
//
//  Created by PCI0007 on 6/26/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

import UIKit

class MonthWithValue {
    var months: String
    var unitSold: CGFloat
    init(_ months: String, _ unitSold: CGFloat) {
        self.months = months
        self.unitSold = unitSold
    }
}

class Ex05: UIViewController {
    let board1 = UIView(frame: CGRect(x: 40, y: 100, width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height - 200))
    let monthList: [MonthWithValue] = [MonthWithValue("Jan", 20.0),MonthWithValue("Feb", 4.0),MonthWithValue("Mar", 6.0),MonthWithValue("April", 3.0),MonthWithValue("May", 12.0),MonthWithValue("Jun", 16.0),MonthWithValue("Jul", 4.0),MonthWithValue("Aug", 18.0),MonthWithValue("Sep", 2.0),MonthWithValue("Oct", 4.0),MonthWithValue("Nov", 5.0),MonthWithValue("Dec", 4.0),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBoard()
        addMonthLable()
    }
    
    private func setupBoard() {
        board1.backgroundColor = .white
        board1.layer.borderWidth = 1
        board1.layer.borderColor = UIColor.black.cgColor
        view.addSubview(board1)
        let monthArray:[String] = ["Jan", "Mar", "May", "Jul", "Sep", "Nov"]
        var y1: CGFloat = 125.0
        var b: CGFloat = 20.0
        var x2: CGFloat = board1.frame.origin.x + 2.5
        for i in 0..<6 {
            let soldValue = UILabel(frame: CGRect(x: 5.0, y: y1, width: 50, height: 50))
            soldValue.font = .systemFont(ofSize: 15)
            soldValue.text = "\(b)"
            y1 += ((board1.bounds.height - 50) / 5)
            b -= 4
            soldValue.textColor = .black
            view.addSubview(soldValue)
            let monthValue = UILabel(frame: CGRect(x: x2, y: board1.frame.maxY - 2, width: 50, height: 50))
            monthValue.font = .systemFont(ofSize: 15)
            monthValue.text = "\(monthArray[i])"
            monthValue.textColor = .black
            x2 +=  ((board1.bounds.width - 80) / 5) + 5
            view.addSubview(monthValue)
        }
        var x3: CGFloat = 2.5
        var y3: CGFloat = 50
        for j in 0..<monthList.count{
            y3 =  board1.bounds.height - (((board1.bounds.height - 50) / 20) * monthList[j].unitSold)
            let column = UIView(frame: CGRect(x: x3, y: y3, width: ((board1.bounds.width / 12) - 5), height: ((board1.bounds.height - 50) / 20) * monthList[j].unitSold ))
            column.backgroundColor = .orange
            column.layer.borderWidth = 1
            column.layer.borderColor = UIColor.black.cgColor
            x3 += board1.bounds.width / 12
            board1.addSubview(column)
        }
    }
    
    private func addMonthLable() {
        var x: CGFloat = 2.5
        var y: CGFloat = 0
        for i in 0..<monthList.count {
            y = board1.bounds.height - (((board1.bounds.height - 50) / 20) * monthList[i].unitSold) - 30
            let monthlable = UILabel(frame: CGRect(x: x, y: y, width: 40, height: 40))
            x += board1.bounds.width / 12
            monthlable.text = "\(monthList[i].unitSold)"
            monthlable.font = .systemFont(ofSize: 15)
            monthlable.textColor = .black
            board1.addSubview(monthlable)
        }
    }
}
