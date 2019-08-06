//
//  Ex7ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex7ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet var buttons: [UIButton]!

    // MARK: - Properties
    var exercise: Exercise?

    // MARK: - Life cycle
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
    }

    // MARK: - Actions
    @IBAction func buttonsActionTouchUpInside(_ button: UIButton) {
        switch button.tag {
        case 1:
            let baiTap7 = BaiTap7ViewController()
            navigationController?.pushViewController(baiTap7, animated: true)
        case 2:
            let baiTap72 = BaiTap72ViewController()
            navigationController?.pushViewController(baiTap72, animated: true)
        case 3:
            let baiTap73 = BaiTap73ViewController()
            navigationController?.pushViewController(baiTap73, animated: true)
        case 4:
            let baiTap74 = BaiTap74ViewController()
            navigationController?.pushViewController(baiTap74, animated: true)
        case 5:
            let baiTap75 = BaiTap75ViewController()
            navigationController?.pushViewController(baiTap75, animated: true)
        default:
            break
        }
    }
}
