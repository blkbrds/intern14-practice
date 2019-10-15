//
//  PracticeTenViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/14/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PracticeTenViewController: UIViewController {

    var zoomStatus: [Bool] = [false, false, false, false]
    var startGraph = 1
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var browButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomStatus[startGraph] = true
        zoomGraph(index: 1)
    }

    private func zoomGraph(index: Int) {
        switch index {
        case 1:
            greenButton.frame.size = CGSize(width: greenButton.frame.size.width * 2, height: greenButton.frame.size.height * 2)
        case 2:
            blueButton.translatesAutoresizingMaskIntoConstraints = false
            blueButton.frame.size = CGSize(width: blueButton.frame.size.width * 2, height: blueButton.frame.size.height * 2)
        case 3:
            orangeButton.translatesAutoresizingMaskIntoConstraints = false
            orangeButton.frame.size = CGSize(width: orangeButton.frame.size.width * 2, height: orangeButton.frame.size.height * 2)
        default:
            browButton.translatesAutoresizingMaskIntoConstraints = false
            browButton.frame.size = CGSize(width: browButton.frame.size.width * 2, height: browButton.frame.size.height * 2)
        }
    }
    
    private func clearZoomGraph(index: Int) {
        switch index {
        case 1:
            greenButton.frame.size = CGSize(width: greenButton.frame.size.width / 2, height: greenButton.frame.size.height / 2)
        case 2:
            blueButton.translatesAutoresizingMaskIntoConstraints = false
            blueButton.frame.size = CGSize(width: blueButton.frame.size.width / 2, height: blueButton.frame.size.height / 2)
        case 3:
            orangeButton.translatesAutoresizingMaskIntoConstraints = false
            orangeButton.frame.size = CGSize(width: orangeButton.frame.size.width / 2, height: orangeButton.frame.size.height / 2)
        default:
            browButton.translatesAutoresizingMaskIntoConstraints = false
            browButton.frame.size = CGSize(width: browButton.frame.size.width / 2, height: browButton.frame.size.height / 2)
        }
    }

    @IBAction func changeZoomButtonClick(_ sender: UIButton) {
        for index in 0..<zoomStatus.count {
            if (zoomStatus[index] && (sender.tag != index + 1)) {
                clearZoomGraph(index: index)
            } else if (!zoomStatus[index] && (sender.tag == index + 1)) {
                zoomGraph(index: index)
            }
        }
    }
}
