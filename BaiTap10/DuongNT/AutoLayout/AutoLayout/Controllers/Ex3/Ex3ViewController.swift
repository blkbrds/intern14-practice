//
//  Ex3ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex3ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet var buttons: [UIButton]!

    // MARK - Properties
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
            let baiTap3 = BaiTap3ViewController()
            navigationController?.pushViewController(baiTap3, animated: true)
        case 2:
            let baiTap32 = BaiTap32ViewController()
            navigationController?.pushViewController(baiTap32, animated: true)
        case 3:
            let baiTap33 = BaiTap33ViewController()
            navigationController?.pushViewController(baiTap33, animated: true)
        default:
            break
        }
    }
}
