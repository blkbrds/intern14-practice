
import UIKit
class Users {
    var name:String
    var myAvatar = UIImage()
    
    
    init(name: String, myAvatar: UIImage) {
        self.name = name
        self.myAvatar = myAvatar
    }
    
}
class BaiTap3ViewController: UIViewController {
    
    var users : [Users] = [ Users(name: "name 1", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 2", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 3", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 4", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 5", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 6", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 7", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 8", myAvatar: #imageLiteral(resourceName: "avatar")),
                            Users(name: "name 9", myAvatar: #imageLiteral(resourceName: "avatar"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAvatar()
    }
    
    func frameView(frame: CGRect, userAvatar: UIImage, name: String, index: Int) -> UIView {
        let pView = UIView(frame: frame)
        pView.backgroundColor = .clear
        
        let userName = UILabel(frame: CGRect(x: 0, y: 150, width: 90, height: 30))
        userName.backgroundColor = .lightGray
        userName.text = name
        userName.textColor = .blue
        userName.textAlignment = .center
        pView.addSubview(userName)
        
        
        let frame = CGRect(x: 0, y: 70, width: 90, height: 80)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        pView.addSubview(userAvatar)
        
        let button = UIButton(frame: CGRect(x: 0, y: 70, width: 90, height: 80))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        button.tag = index
        pView.addSubview(button)
        
        return pView
        
    }
    
    func listAvatar() {
        var x: CGFloat = 30
        var y: CGFloat = 50
        for index in 0..<users.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 30
                y += 130 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130 )
            x += 100
            let views = frameView(frame: frame, userAvatar: users[index].myAvatar, name: users[index].name, index: index)
            view.addSubview(views)
            
        }
    }
    @objc func buttonDidClick(button: UIButton) {
        print("\(users[button.tag].name)")
    }
    
}


