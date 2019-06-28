//
//  Ex0003.swift
//  BaitapIBaction
//
//  Created by PCI0007 on 6/27/19.
//  Copyright © 2019 PCI0007. All rights reserved.
//

//import UIKit
//
//class User {
//    var name: String = ""
//    var avatar = UIImage()
//    init (_ name: String, _ avatar: UIImage) {
//        self.name = name
//        self.avatar = avatar
//    }
//    
//}
//
//class Ex0003: UIViewController {
//    var users: [User] = [User("User 1", #imageLiteral(resourceName: "download (1)")), User("User 2", #imageLiteral(resourceName: "download (2)")), User("User 3", #imageLiteral(resourceName: "download (3)")), User("User 4", #imageLiteral(resourceName: "download (4)")), User("User 5", #imageLiteral(resourceName: "5")), User("User 6", #imageLiteral(resourceName: "6")), User("User 7", #imageLiteral(resourceName: "s-l1600")), User("User 8", #imageLiteral(resourceName: "5020657994618_01c")), User("User 9", #imageLiteral(resourceName: "5020657994625_01c"))]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addUserView()
//        
//    }
//
//    func addUserView() {
//        let board = UIView(frame: CGRect(x: 7, y: 178, width: 400, height: 500))
//        board.backgroundColor = .gray
//        view.addSubview(board)
//        var x:CGFloat = 0
//        var y:CGFloat = 0
//        let boardWidth = board.bounds.width / 3
//        let boardHeight = board.bounds.height / 3
//        for i in 0..<users.count {
//            let userViewBig = UIView(frame: CGRect(x: x, y: y, width: boardWidth, height: boardHeight))
//            x += boardWidth
//            if x >= board.bounds.width  {
//                x = 0
//                y += boardHeight
//            }
//            viewArray.append(userViewBig)
//            
//            var x1: CGFloat = userViewBig.bounds.width - 5
//            var y1: CGFloat = userViewBig.bounds.width - 5
//            
//            
//            userViewBig.layer.borderWidth = 2
//            userViewBig.layer.borderColor = UIColor.blue.cgColor
//            board.addSubview(userViewBig)
//            let userImage = UIImageView(frame: CGRect(x: x1, y: y1, width: userViewBig.bounds.width - 5, height: userViewBig.bounds.height - 5))
//            
//            
//        }
//        
//        
//    }
//    
//}
