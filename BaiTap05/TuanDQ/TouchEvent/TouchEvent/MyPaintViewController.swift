//
//  MyPaintViewController.swift
//  TouchEvent
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyPaintViewController: UIViewController {

    

    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var drawMainView: DrawCanvasView!
    @IBOutlet weak var greenBrush: UIButton!
    @IBOutlet weak var redBrush: UIButton!
    @IBOutlet weak var lightBlueBrush: UIButton!
    @IBOutlet weak var yellowBrush: UIButton!
    @IBOutlet weak var indigoBrush: UIButton!
    @IBOutlet weak var orangeBrush: UIButton!
    @IBOutlet weak var whiteBrush: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawMainView.settingCurrentPosition(point: drawMainView.frame.origin)
    }
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        print("Save")
    }
    
    @IBAction func resetButtonClick(_ sender: UIButton) {
        drawMainView.reset()
    }

    @IBAction func colorChangeClick(_ sender: UIButton) {
        switch sender {
        case greenBrush:
            drawMainView.setStrokeColor(color: UIColor.green)
        case redBrush:
            drawMainView.setStrokeColor(color: UIColor.red)
        case lightBlueBrush:
            drawMainView.setStrokeColor(color: UIColor.blue)
        case yellowBrush:
            drawMainView.setStrokeColor(color: UIColor.yellow)
        case indigoBrush:
            drawMainView.setStrokeColor(color: UIColor.systemIndigo)
        case orangeBrush:
            drawMainView.setStrokeColor(color: UIColor.orange)
        case whiteBrush:
            drawMainView.setStrokeColor(color: UIColor.white)
        default:
            drawMainView.setStrokeColor(color: UIColor.black)
        }
    }
    
}
