//
//  Ex4ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex4ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet var buttons: [UIButton]!
    
    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Config
    override func setupUI() {
        super.setupUI()
        self.title = exercise?.name
        buttons.forEach { button in
            button.layer.cornerRadius = 5
        }
    }

    override func setupData() {
        super.setupData()
    }

    // MARK: - Actions
    @IBAction func buttonsActionTouchUpInside(_ button: UIButton) {
        switch button.tag {
        case 1:
            let baiTap4 = BaiTap4ViewController()
            navigationController?.pushViewController(baiTap4, animated: true)
        case 2:
            let baiTap42 = BaiTap42ViewController()
            navigationController?.pushViewController(baiTap42, animated: true)
        case 3:
            let baiTap43 = BaiTap43ViewController()
            navigationController?.pushViewController(baiTap43, animated: true)
        case 4:
            let baiTap44 = BaiTap44ViewController()
            navigationController?.pushViewController(baiTap44, animated: true)
        case 5:
            let baiTap45 = BaiTap45ViewController()
            navigationController?.pushViewController(baiTap45, animated: true)
        default:
            break
        }
    }
}
