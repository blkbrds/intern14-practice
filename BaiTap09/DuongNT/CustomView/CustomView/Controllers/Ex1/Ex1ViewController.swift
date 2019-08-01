//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var uiScrollView: UIScrollView!
    
    // MARK: - Properties
    var exercise: Exercise?
    private var listUser: [User] = []

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
        if let pathComponent = url.appendingPathComponent("/ListUsers.plist") {
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
        listUser = User.parseData(array: FileManagers.readPlist(namePlist: "ListUsers"))
    }

    private func getMyAvatar(_ user: User, _ index: Int) -> UIView {
        let userView = MyAvatarView(frame: CGRect(x: 20, y: 100, width: 100, height: 150))
        userView.delegate = self
        userView.userAvatar?.image = UIImage(named: user.avatar)
        userView.userName?.text = user.name
        userView.button?.tag = index
        return userView
    }

    private func setUpListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        for index in 0..<listUser.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 20
                y += 150 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 150)
            x += 120
            let viewAvatar = getMyAvatar(listUser[index], index + 1)
            viewAvatar.frame = frame
            uiScrollView.addSubview(viewAvatar)
            view.addSubview(uiScrollView)
        }
        uiScrollView.contentSize.height = y + 170
    }
}

// MARK: - Extension
extension Ex1ViewController: MyAvatarViewDelegate {

    func view(_ view: MyAvatarView, needPerformAction action: MyAvatarView.Action) {
        switch action {
        case .selectAvatar(let index):
            print(index)
        }
    }
}
