//
//  AvatarsViewController.swift
//  Avatars
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class AvatarsViewController: UIViewController {
    
    var personsInfo: [AvatarItemView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        personsInfo = [
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 1", tag: 1)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 2", tag: 2)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 3", tag: 3)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 4", tag: 4)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 5", tag: 5)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 6", tag: 6)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 7", tag: 7)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 8", tag: 8)),
            AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 9", tag: 9))
        ]
        settingLayout()
    }

    private func settingLayout() {
        
        let leftMargin = 25
        let topMargin = 125
        var x:Int = leftMargin
        var y:Int = 50
        
        let maxHeight = Int(UIScreen.main.bounds.size.height)
        let maxWidth = Int(UIScreen.main.bounds.size.width)
        // Calculate to display.
        for person in personsInfo {
            addComponent(x: x, y: y, person: person)
            
            // Move to new point.
            x += Int(person.frame.width) + leftMargin
            if (x + Int(person.frame.width) > maxWidth) {
                x = leftMargin
                y += topMargin
            }
            if (y > maxHeight - topMargin + leftMargin) {
                break
            }
        }
    }
    
    func addComponent(x xPoint: Int, y yPoint: Int, person personInfo: AvatarItemView) {
        personInfo.frame = CGRect(origin: CGPoint(x: xPoint, y: yPoint), size: CGSize(width: personInfo.bounds.width, height: personInfo.bounds.height))
        let demo: AvatarItemView = AvatarItemView(PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 9", tag: 9))
        self.view.addSubview(demo)
    }

    @IBAction func viewPersonInformation(_ sender: UIButton) {
//        switch sender {
//        case personInfo1:
//            print("Avatar name : \(personName1.text!)")
//        case personInfo2:
//            print("Avatar name : \(personName2.text!)")
//        case personInfo3:
//            print("Avatar name : \(personName3.text!)")
//        case personInfo4:
//            print("Avatar name : \(personName4.text!)")
//        case personInfo5:
//            print("Avatar name : \(personName5.text!)")
//        case personInfo6:
//            print("Avatar name : \(personName6.text!)")
//        case personInfo7:
//            print("Avatar name : \(personName7.text!)")
//        case personInfo8:
//            print("Avatar name : \(personName8.text!)")
//        case personInfo9:
//            print("Avatar name : \(personName9.text!)")
//        default:
//            print("Have no information")
//        }
    }
}
