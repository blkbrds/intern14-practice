//
//  Ex01ViewController.swift
//  Baitap-Outlet-Action
//
//  Created by MBA0217 on 8/16/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentTime()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touch.location(in: view)
            getCurrentTime()
        }
    }
    
    func getCurrentTime() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss dd-MM-yyyy"
        let result = dateFormatter.string(from: date)
        dateLabel.text = result
        
        view.addSubview(dateLabel)
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
