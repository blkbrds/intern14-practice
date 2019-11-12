//
//  ChartView.swift
//  CustomView
//
//  Created by MBA0051 on 10/4/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class ChartView: ParentView {

    var bars: [BarChart] = []
    var maxValue: Float = 22.0
    @IBOutlet weak var barchartView: UIView!
    @IBOutlet weak var measurementView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        initial()
        loadBartChart()
        loadMeasurementView()
    }
    
    private func initial() {
        // Do any additional setup after loading the view.
        bars = [
            BarChart(month: "Jan", value: 20.0),
            BarChart(month: "Feb", value: 20.0),
            BarChart(month: "Mar", value: 6.0),
            BarChart(month: "Apr", value: 20.0),
            BarChart(month: "May", value: 12.0),
            BarChart(month: "Jun", value: 4.0),
            BarChart(month: "Dec", value: 5.0)
        ]
    }

    private func loadBartChart() {

        let imageNumber = bars.count
        let w = 10
        // margin for each bar.
        let margin = (Int(barchartView.frame.size.width) - (imageNumber * w)) / imageNumber
        var startX = margin
        // Y alway is 0
        // Calculate height.
        var height: Float = 0
        
        for barNo in 0..<imageNumber {
            height = Float(barchartView.frame.size.height) * bars[barNo].value / maxValue
            addComponent(container: barchartView, x: startX, y: (Float(barchartView.frame.size.height) - height), w: w, h: height)
            startX += w + margin
        }
    }
    
    private func addComponent(container rootView: UIView, x xPoint: Int, y yPoint: Float, w width: Int, h height: Float) {
        let barView = UIView(frame: CGRect(x: xPoint, y: Int(yPoint), width: width, height: Int(height)))
        barView.layer.borderWidth = 1
        barView.backgroundColor = UIColor.orange
        rootView.addSubview(barView)
    }

    private func loadMeasurementView() {
        
        let leftX: CGFloat = 0.0
        let constantH: CGFloat = 50.0
        let constantW: CGFloat = 100
        let chartWidth = measurementView.frame.size.width
        let chartHeight = barchartView.frame.size.height
        
        // Draw the first label.
        var locateLeft = CGRect(x: leftX, y: chartHeight, width: constantW, height: constantH)
        measurementView.addSubview(createLabel(position: locateLeft, content: "0", orient: .left))
        var locateRight = CGRect(x: chartWidth - constantW, y: chartHeight, width: constantW, height: constantH)
        measurementView.addSubview(createLabel(position: locateRight, content: "0", orient: .right))
        
        
        
        
        // Draw other label.
        let margin = (Int(barchartView.frame.size.width) - (bars.count * 10)) / bars.count
        let partValue = getPartHeight()
        let partHeight = (Float(chartHeight) - Float(margin)) / 11
        var yPosition: Float = 0.0
        for index in 1...5 {
            yPosition = Float(chartHeight) - (Float(index) * 2.0 * partHeight)
            locateLeft = CGRect(x: leftX, y: CGFloat(yPosition), width: constantW, height: constantH)
            measurementView.addSubview(
                createLabel(position: locateLeft, content: String(index * 2 * partValue), orient: .left))
            locateRight = CGRect(x: chartWidth - constantW, y: CGFloat(yPosition), width: constantW, height: constantH)
            measurementView.addSubview(createLabel(position: locateRight, content: "0", orient: .right))
        }
    }
    
    /**
     * Get range values.
     */
    private func getPartHeight() -> Int {
        var max:Float = 0.0
        for item in bars {
            if item.value >= max {
                max = item.value
            }
        }

        let number = Int(max / 10)
        if Float(number * 10) < max {
            return number
        }
        return number
    }

    private func createLabel(position: CGRect, content: String, orient: NSTextAlignment) -> UILabel {
        let firstItem = UILabel()
        firstItem.text = content
        firstItem.frame = position
        firstItem.textAlignment = orient
        firstItem.font = UIFont.boldSystemFont(ofSize: 15)
        return firstItem
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.black.cgColor)
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawLine(from: CGPoint(x: 100.0, y: 100.0), to: CGPoint(x: 150.0, y: 200.0))
    }
}
