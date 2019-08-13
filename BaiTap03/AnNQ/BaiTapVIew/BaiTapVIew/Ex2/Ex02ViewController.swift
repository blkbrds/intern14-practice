//
//  Ex02ViewController.swift
//  BaiTapVIew
//
//  Created by MBA0217 on 8/12/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var avatar: String
    init(_ name: String, _ avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

class Ex02ViewController: UIViewController {

    var users: [Person] = [
        Person("An", "avatar.jpg"),
        Person("Bo", "avatar.jpg"),
        Person("Cao", "avatar.jpg"),
        Person("Dao", "avatar.jpg"),
        Person("Giang", "avatar.jpg"),
        Person("Hien", "avatar.jpg"),
        Person("Khanh", "avatar.jpg"),
        Person("Lien", "avatar.jpg"),
        Person("Manh", "avatar.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
    }
    
    func addProfileView (_ frame: CGRect,_ name: String,_ avatar: String) -> UIView {
        let container = UIView(frame: frame)
        
        let userAvatar = UIImageView(image: UIImage(named: avatar))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: 130, width: 120, height: 30))
        userName.text = name
        userName.backgroundColor = UIColor(red: 0.0, green: 0.7, blue: 1.3, alpha: 1.0)
        userName.textColor = .white
        userName.textAlignment = .center
        container.addSubview(userName)
        
        return container
    }
    
    func show () {
        var x: CGFloat = 20
        var y: CGFloat = 40
        for i in 0..<users.count {
            let frame = CGRect(x: x, y: y, width: 120, height: 130)
            let container = addProfileView(frame, users[i].name, users[i].avatar)
            view.addSubview(container)
            x += 130
            if (i + 1) % 3 == 0 {
                x = 20
                y += 160 + 10
            }
        }
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
