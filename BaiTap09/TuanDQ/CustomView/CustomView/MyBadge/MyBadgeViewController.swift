//
//  MyBadgeViewController.swift
//  CustomView
//
//  Created by MBA0051 on 10/3/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyBadgeViewController: UIViewController {

    @IBOutlet weak var emailButton: UIView!
    @IBOutlet weak var friendsButton: UIView!
    @IBOutlet weak var photosButton: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "MySliderViewController"
        
        loadNibToView(view: emailButton, color: .blue, title: "Email", numberOfNotification: 10, tag: 1)
        loadNibToView(view: friendsButton, color: .green, title: "Friends", numberOfNotification: 2, tag: 2)
        loadNibToView(view: photosButton, color: .orange, title: "Photos", numberOfNotification: 0, tag: 3)
    }


    private func loadNibToView(view itemView: UIView, color badgetColor: UIColor, title: String, numberOfNotification: Int, tag viewTag: Int) {
        guard let nib = Bundle.main.loadNibNamed("BadgetItem", owner: self, options: nil)?[0] as? BadgetItem else { return }
        nib.frame = itemView.bounds
        nib.setting(color: badgetColor, type: title, number: numberOfNotification)
        nib.tag = viewTag
        nib.delegate = self
        itemView.addSubview(nib)
    }

}

extension MyBadgeViewController: BadgeButtonItemDelegate {
    func viewDetailNotification(view: BadgetItem) {
        switch view.tag {
        case 1:
            print("Email notification detail")
        case 2:
            print("Friends notification detail")
        case 3:
            print("Photos notification detail")
        default:
            return
        }
    }
}
