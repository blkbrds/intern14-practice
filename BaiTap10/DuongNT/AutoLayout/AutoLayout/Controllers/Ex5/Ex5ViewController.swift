//
//  Ex5ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex5ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet var buttons: [UIButton]!

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: Life Cycle
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
            let baiTap5 = BaiTap5ViewController()
            navigationController?.pushViewController(baiTap5, animated: true)
        case 2:
            let baiTap52 = BaiTap52ViewController()
            navigationController?.pushViewController(baiTap52, animated: true)
        case 3:
            let baiTap53 = BaiTap53ViewController()
            navigationController?.pushViewController(baiTap53, animated: true)
        case 4:
            let baiTap54 = BaiTap54ViewController()
            navigationController?.pushViewController(baiTap54, animated: true)
        case 5:
            let baiTap55 = BaiTap55ViewController()
            navigationController?.pushViewController(baiTap55, animated: true)
        default:
            break
        }
    }
}
