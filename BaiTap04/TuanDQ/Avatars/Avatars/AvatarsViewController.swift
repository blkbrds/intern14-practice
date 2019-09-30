//
//  AvatarsViewController.swift
//  Avatars
//
//  Created by MBA0051 on 9/27/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class AvatarsViewController: UIViewController {
    
    var personsInfo: [PersonInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        personsInfo = [
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 1", tag: 1),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 2", tag: 2),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 3", tag: 3),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 4", tag: 4),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 5", tag: 5),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 6", tag: 6),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 7", tag: 7),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 8", tag: 8),
            PersonInfo(personImage: UIImage(named: "avatar.png")!, personName: "User 9", tag: 9)
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
        let viewH = 130
        let viewW = 100
        // Calculate to display.
        for person in personsInfo {
            let locate = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: viewW, height: viewH))
            addComponent(person: person, point: locate)
            
            // Move to new point.
            x += viewW + leftMargin
            if (x + viewW > maxWidth) {
                x = leftMargin
                y += topMargin
            }
            if (y > maxHeight - topMargin + leftMargin) {
                break
            }
        }
    }
    
    func addComponent(person personInfo: PersonInfo, point localtion: CGRect) {
        let componentName = "AvatarItemView"
        guard let nib = Bundle.main.loadNibNamed(componentName, owner: nil, options: nil)?[0] as? AvatarItemView else { return }
        nib.setting(person: personInfo)
        nib.frame = localtion
        self.view.addSubview(nib)
    }
}
