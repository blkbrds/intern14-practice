//
//  Ex01ViewController.swift
//  BaiTapVIew
//
//  Created by MBA0217 on 8/12/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

class Ex01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.jpg"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
        userName.text = "Name"
        userName.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        userName.textColor = .white
        userName.textAlignment = .center
        view.addSubview(userName)
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
