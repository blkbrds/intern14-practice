//
//  ChartViewController.swift
//  CustomView
//
//  Created by MBA0217 on 10/1/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    @IBOutlet weak var chartView: UIView!
    
    let valueArray: [CGFloat] = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI () {
        var x: CGFloat = 0
        for i in 0..<valueArray.count {
            if i != 0 {
                x += 27
            }
            let columnView = ColumnView.loadNibNamed()
            columnView.frame.origin.x = x
            columnView.setupColumnView(value: valueArray[i], x: x, frame: columnView.frame)
            chartView.addSubview(columnView)
        }
    }
}
