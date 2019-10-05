//
//  MyPickerViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/5/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyPickerViewController: UIViewController {

    @IBOutlet weak var converPickerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let nib = Bundle.main.loadNibNamed("SliderItem", owner: self, options: nil)?[0] as? SliderItem else { return }

        // Event change size with current bounds. - Understanding it is.
        nib.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        nib.delegate = self
        converPickerView.addSubview(nib)
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
