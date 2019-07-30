//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {

    // MARK: properties

    var exercise: Exercise?
    let myChart = MyChartView()

    // MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        myChart.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: config

    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        view.addSubview(myChart)
    }

    override func setupData() {
    }
}

// MARK: extension

extension Ex6ViewController: MyChartViewDataSource {
    func numberOfColumn(myChart: MyChartView) -> Int {
        return 10
    }

    func nameOfColumn(myChart: MyChartView) -> String {
        return ""
    }

    func valueOfColumn(myChart: MyChartView) -> Float {
        return 0.0
    }

}
