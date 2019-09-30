//
//  MySliderViewController.swift
//  MySlider
//
//  Created by MBA0051 on 9/26/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MySliderViewController: UIViewController {

    var container = UIView()
    var blueView: UIView = UIView()
    var whiteView: UIView = UIView()
    var myButton: UIButton = UIButton()
    let viewSize = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let frame = CGRect(x: 180, y: 250, width: 40, height: 300)
        let container = sliderView(frame: frame, number: 65)
        view.addSubview(container)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func sliderView (frame: CGRect, number: Double) -> UIView{
        
        container = UIView(frame: frame)
        container.backgroundColor = .white
        blueView = UIView(frame: CGRect(x: 10, y: 0, width: 25, height: viewSize))
        blueView.layer.borderWidth = 1
        blueView.layer.borderColor = UIColor(red: 0, green: 89 / 255, blue: 153 / 255, alpha: 1.0).cgColor
        blueView.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        // Test
//        blueH = 450
//        blueView. =
        container.addSubview(blueView)

        // Add white view
        whiteView = UIView(frame: CGRect(x: 10, y: 0, width: 25, height: viewSize))
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor(red: 0, green: 89 / 255, blue: 153 / 255, alpha: 1.0).cgColor
        whiteView.backgroundColor = .white
        container.addSubview(whiteView)
       
        // Add button
        let position = ((100 - number) * Double(blueView.bounds.height) / 100) - 5
        print(position, number, whiteView.bounds.height)
        myButton = UIButton(frame: CGRect(x: 0, y: position, width: 50, height: 50))
        myButton.layer.borderWidth = 2
        myButton.layer.borderColor = UIColor(red: 165 / 255, green: 102 / 255, blue: 0.0, alpha: 1.0).cgColor
        myButton.backgroundColor = UIColor(red: 1.0, green: 145 / 255, blue: 0.0, alpha: 1.0)
        myButton.setTitle("\(Int(number))", for: .normal)
        myButton.layer.cornerRadius = myButton.bounds.width / 2
        myButton.addTarget(self, action: #selector(buttonMove), for: .touchUpInside)
        container.addSubview(myButton)
        // White at center.
        whiteView.frame.size.height = myButton.center.y

        return container
    }
    
    /**
     * Increment slide.
     */
    @objc func buttonMove() {
//        whiteView.frame.size.height = myButton?.center.y
        // Get current value
        var currentValue:Int? = Int(myButton.currentTitle!)
        currentValue! += 5
        if (currentValue! > 100) {
            return
        }

        // Calculate size.
        let position = (Int(container.frame.size.height) / 100) * (100 - currentValue!)
        myButton.frame = CGRect(x: 0, y: position, width: 50, height: 50)
        myButton.setTitle("\(currentValue!)", for: .normal)
        whiteView.frame.size.height = myButton.center.y
    }
}
