//
//  Ex2ViewController.swift
//  Protocol
//
//  Created by Nguyen Duong on 8/12/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex2ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var uiScrollView: UIScrollView!

    // MARK: - Properties
    var exercise: Exercise?
    private var listUser: [Users] = []

    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        setUpListAvatar()
    }

    override func setupData() {
        super.setupData()
        loadFilePlist()
    }

    // MARK: - Customer func
    private func checkExistFileDocument() -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("/ListUserInform.plist") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }

    private func loadFilePlist() {
        if !checkExistFileDocument() {
            FileManagers.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
        }
        listUser = Users.parseData(array: FileManagers.readPlist(namePlist: "ListUserInform"))
    }
    
    private func getMyAvatar(_ user: Users, _ index: Int) -> UIView {
        let userView = Bundle.main.loadNibNamed("MyAvatarView", owner: self, options: nil)?.first as? MyAvatarView
        userView?.delegate = self
        userView?.avatarImageView.image = UIImage(named: user.avatar)
        userView?.nameLabel.text = user.name
        userView?.index = index
        userView?.tag = index
        return userView!
    }

    private func setUpListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 20
        for index in 0..<listUser.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 20
                y += 130 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 130)
            x += 120
            let viewAvatar = getMyAvatar(listUser[index], index)
            viewAvatar.frame = frame
            uiScrollView.addSubview(viewAvatar)
        }
        uiScrollView.contentSize.height = y + 130
    }
}

// MARK: - Extension
extension Ex2ViewController: MyAvatarViewDelegate {
    func imageView(view: MyAvatarView, needPerform action: MyAvatarView.Action, index: Int) {
        switch action {
        case .selectedAvatar:
            let myAvatarDetailVC = MyAvatarDetailViewController()
            myAvatarDetailVC.delegate = self
            myAvatarDetailVC.index = index
            myAvatarDetailVC.user = listUser[index]
            navigationController?.pushViewController(myAvatarDetailVC, animated: true)
        }
    }
}


extension Ex2ViewController: MyAvatarDetailViewControllerDelegate {
    func detailView(_ view: MyAvatarDetailViewController, index: Int, user: Users) {
        //get item
        let userOld = listUser[index]
        //get view
        for view in uiScrollView.subviews {
            if view.tag == index {
                let userView = view as! MyAvatarView
                userView.avatarImageView.image = UIImage(named: user.avatar)
                userView.nameLabel.text = user.name
                //save file
                FileManagers.writePlistToList(user, userOld.name)
                break
            }
        }
    }
}
