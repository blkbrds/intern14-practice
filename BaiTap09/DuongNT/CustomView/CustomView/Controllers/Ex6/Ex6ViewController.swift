//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {

    // MARK: - Properties
    var exercise: Exercise?
    private let myChart = MyChartView()
    private var dataChart: [Charts] = [
        Charts(month: "Jan", percent: 20.0),
        Charts(month: "Feb", percent: 18.0),
        Charts(month: "Mar", percent: 6.0),
        Charts(month: "Apr", percent: 3.0),
        Charts(month: "May", percent: 12.0),
        Charts(month: "Jun", percent: 16.0),
        Charts(month: "Jul", percent: 4.0),
        Charts(month: "Aug", percent: 16.0),
        Charts(month: "Sep", percent: 2.0),
        Charts(month: "Oct", percent: 24.0),
        Charts(month: "Nov", percent: 5.0),
        Charts(month: "Dec", percent: 4.0)]

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        myChart.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        view.addSubview(myChart)
    }

    override func setupData() {
        super.setupData()
    }
}

// MARK: - Extension
extension Ex6ViewController: MyChartViewDataSource {

    func numberOfColumn() -> Int {
        return dataChart.count
    }

    func nameOfColumn(titleForRow row: Int) -> String {
        return String(dataChart[row].month)
    }

    func valueOfColumn(titleForRow row: Int) -> Float {
        return Float(dataChart[row].percent)
    }

    func maxValueOfHeight() -> Int {
        var max = dataChart[0].percent
        for index in 1..<dataChart.count {
            if dataChart[index].percent > max {
                max = dataChart[index].percent
            }
        }
        return Int(max)
    }
}
