//
//  MyViewController.swift
//  Avatar
//
//  Created by MBA0051 on 9/26/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let leftMargin = 25
        let topMargin = 125
        let w:Int = 50
        let h:Int = 50
        
        // Data pass to application.
        let imageNumber = 9
        let imageName:[String] = ["avatar.png", "avatar.png", "avatar.png",
                                  "avatar.png", "avatar.png", "avatar.png",
                                  "avatar.png", "avatar.png", "avatar.png"]
        let userNames:[String] = ["user 1", "user 2", "user 3",
                                  "user 4", "user 5", "user 6",
                                  "user 7", "user 8", "user 9"]
        
        var x:Int = leftMargin
        var y:Int = h
        
        let maxHeight = Int(UIScreen.main.bounds.size.height)
        let maxWidth = Int(UIScreen.main.bounds.size.width)
        // Calculate to display.
        for avatarNo in 0..<imageNumber {
            // display
            addComponent(x: x, y: y, w: w, h: h, name: userNames[avatarNo], img: imageName[avatarNo])
            
            // Move to new point.
            x += w + leftMargin
            if (x + w > maxWidth) {
                x = leftMargin
                y += topMargin
            }
            if (y > maxHeight - topMargin + leftMargin) {
                break
            }
        }
    }

    func addComponent(x xPoint: Int, y yPoint: Int, w width: Int, h height: Int,
                        name nameDisplay: String, img imageName: String) {
        // Add user Avatar
        let frame = CGRect(x: xPoint, y: yPoint, width: width, height: height)
        let userAvatar = UIImageView(image: UIImage(named: imageName))
        userAvatar.frame = frame
        userAvatar.contentMode = UIView.ContentMode.scaleToFill
        view.addSubview(userAvatar)
        
        // Add user name
        let userName = UILabel(frame: CGRect(x: xPoint, y: yPoint + height, width: width, height: height / 2))
        userName.text = nameDisplay
        userName.backgroundColor = .lightGray
        userName.textColor = .blue
        view.addSubview(userName)
        
        // Add button.
        let button = UIButton(frame: CGRect(x: xPoint, y: yPoint, width: width, height: 3 * height / 2))
        button.backgroundColor = .clear
        // Add event - call to buttonDidClick()
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    /**
     * Event listening when button has clicked.
     */
    @objc func buttonDidClick() {
        print("Button has been clicked.")
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
