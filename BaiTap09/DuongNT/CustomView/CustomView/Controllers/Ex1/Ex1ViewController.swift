//
//  Ex1ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex1ViewController: BaseViewController {

    // MARK: - outlet

    @IBOutlet weak var uiScrollView: UIScrollView!

    // MARK: - properties

    var exercise: Exercise?
    private var isFirstDisplay: Bool = true
    private var listUsers: [User] = []

    // MARK: - life cycle

    override func viewWillAppear(_ animated: Bool) {
        if isFirstDisplay {
            isFirstDisplay = !isFirstDisplay
        } else {
            setupUI()
            setupData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - config

    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        setUpListAvatar()
    }

    override func setupData() {
        loadFilePlist()
    }

    // MARK: - customer func
    
    func loadFilePlist() {
        let a = UserDefaults.standard.bool(forKey: "firstLoad")
        print(a)
        if !a {
            FileManagers.copyFilesFromBundleToDocumentsFolderWith(fileExtension: "plist")
            UserDefaults.standard.set(true, forKey: "firstLoad")
            listUsers = User.parseData(array: FileManagers.readPlist(namePlist: "ListUsers"))
        } else {
            listUsers = User.parseData(array: FileManagers.readPlist(namePlist: "ListUsers"))
        }
    }

    private func setUpMyAvatar(_ user: User, _ index: Int) -> UIView {
        let userView = MyAvatar(frame: CGRect(x: 20, y: 100, width: 100, height: 150))

        userView.delegate = self
        userView.userAvatar?.image = UIImage(named: user.avatar)
        userView.userName?.text = user.name
        userView.button?.tag = index
        return userView
    }

    private func setUpListAvatar() {
        var x: CGFloat = 20
        var y: CGFloat = 50
        uiScrollView.contentSize.height = 2000
        for index in 0..<listUsers.count {
            if (x + 120) >= UIScreen.main.bounds.width {
                x = 20
                y += 150 + 20
            }
            let frame =  CGRect(x: x, y: y, width: 100 , height: 150)
            x += 120
            let viewAvatar = setUpMyAvatar(listUsers[index], index + 1)
            viewAvatar.frame = frame
            uiScrollView.addSubview(viewAvatar)
            view.addSubview(uiScrollView)
        }
    }
}

// MARK: - extension

extension Ex1ViewController: MyAvatarDelegate {
    func userView(_ userView: MyAvatar, didSelect index: Int) {
        print("Selected user with index \(index)")
    }
}
