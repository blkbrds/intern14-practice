//
//  MyBarChartViewController.swift
//  YearBarChart
//
//  Created by MBA0051 on 9/26/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

struct BarChart {
    var month : String
    var value : Float
    
    init(_ month : String,_ value: Float){
        self.month = month
        self.value = value
    }
}

class MyBarChartViewController: UIViewController {

    var barArray: [BarChart] = []
    var maxValue: Float = 22.0

    var frameBar: CGRect = CGRect()
    let xFrameBar = 60
    let yFrameBar = 100
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        barArray = [
            BarChart("Jan", 20.0),
            BarChart("Feb", 20.0),
            BarChart("Mar", 6.0),
            BarChart("Apr", 20.0),
            BarChart("May", 12.0),
            BarChart("Jun", 4.0),
            BarChart("Jul", 4.0),
            BarChart("Aug", 4.0),
            BarChart("Sep", 2.0),
            BarChart("Oct", 2.0),
            BarChart("Nov", 5.0),
            BarChart("Dec", 5.0)
        ]
        let frameMeasure = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let frameBar = CGRect(x: CGFloat(xFrameBar), y: CGFloat(yFrameBar), width: CGFloat(Int(UIScreen.main.bounds.width) - 2 * xFrameBar), height: CGFloat(Int(UIScreen.main.bounds.height) - 2 * yFrameBar))

        view.addSubview(createMeasurementView(frame: frameMeasure))
        view.addSubview(createBarChartView(frame: frameBar))
    }

    func createMeasurementView(frame: CGRect) -> UIView {
        
//        var measureVal: Float = 0.0
//        let incrementVal = maxValue / 5
        let container = UIView(frame: frame)
        container.backgroundColor = .gray
        
        let widthWrapper: CGFloat = UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 19 / 100)
        let heightWrapper: CGFloat = UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 27 / 100)
        let yWrapper: CGFloat = UIScreen.main.bounds.height * 11 / 100
        
        var i = 0.0
        var y: CGFloat = heightWrapper + yWrapper - 10
        let partSize = heightWrapper / 5.5
        let x: CGFloat = UIScreen.main.bounds.width - 28
        let size = UIScreen.main.bounds.width * 2.5 / 100
        var yAxis: CGFloat = heightWrapper
        var xAxis: CGFloat = 0
        
        
        while(i <= 20.0) {
            // Add left label
            let leftLabel = UILabel(frame: CGRect(x: 10, y: y, width: 30, height: 20))
            leftLabel.text = "\(i)"
            leftLabel.font = UIFont(name: leftLabel.font.fontName, size: size)

            // Add right label
            let rightLabel = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 20))
            rightLabel.text = "\(i)"
            rightLabel.font = UIFont(name: rightLabel.font.fontName, size: size)
            i += 4.0
            
            if i == 0.0 {
              y = y - yWrapper - partSize
            } else {
                y -= partSize
                
                let xAxisLabel = UILabel(frame: CGRect(x: 0, y: yAxis, width: widthWrapper, height: 1))
                xAxisLabel.backgroundColor = UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)
                container.addSubview(xAxisLabel)
                yAxis -= partSize
            }
            
            let yAxisLabel = UILabel(frame: CGRect(x: xAxis, y: 0, width: 1, height: heightWrapper))
            yAxisLabel.backgroundColor = UIColor(red: 145 / 255, green: 148 / 255, blue: 156 / 255, alpha: 1.0)
            container.addSubview(yAxisLabel)
            xAxis += widthWrapper / 6
            
            container.addSubview(leftLabel)
            container.addSubview(rightLabel)
        }
        return container
    }

    func createBarChartView(frame: CGRect) -> UIView {
        let barContainer = UIView(frame: frame)
        
        let imageNumber = barArray.count
        let w = 10
        // margin for each bar.
        let margin = (Int(barContainer.frame.size.width) - (imageNumber * w)) / imageNumber
        var startX = margin
        // Y alway is 0
        // Calculate height.
        var height: Float = 0
        
        for barNo in 0..<imageNumber {
            height = Float(barContainer.frame.size.height) * barArray[barNo].value / maxValue
            addComponent(container: barContainer, x: startX, y: (Float(barContainer.frame.size.height) - height), w: w, h: height)
            startX += w + margin
        }
        
        return barContainer
    }
    
    func calculateSize(h maxHeight: Int) -> Int? {
        return 0
    }
    func addComponent(container rootView: UIView, x xPoint: Int, y yPoint: Float, w width: Int, h height: Float) {
        let barView = UIView(frame: CGRect(x: xPoint, y: Int(yPoint), width: width, height: Int(height)))
        barView.layer.borderWidth = 1
        barView.backgroundColor = UIColor.orange
        rootView.addSubview(barView)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
