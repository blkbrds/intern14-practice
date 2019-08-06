//
//  Ex6ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex6ViewController: BaseViewController {

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
            let baiTap6 = BaiTap6ViewController()
            navigationController?.pushViewController(baiTap6, animated: true)
        case 2:
            let baiTap62 = BaiTap62ViewController()
            navigationController?.pushViewController(baiTap62, animated: true)
        case 3:
            let baiTap63 = BaiTap63ViewController()
            navigationController?.pushViewController(baiTap63, animated: true)
        case 4:
            let baiTap64 = BaiTap64ViewController()
            navigationController?.pushViewController(baiTap64, animated: true)
        case 5:
            let baiTap65 = BaiTap65ViewController()
            navigationController?.pushViewController(baiTap65, animated: true)
        default:
            break
        }
    }
}
