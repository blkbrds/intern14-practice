//
//  Ex2ViewController.swift
//  PracticeTemplate
//
//  Created by Tien Le P. on 6/22/18.
//  Copyright © 2018 Tien Le P. All rights reserved.
//

import UIKit

class Ex2ViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet var buttons: [UIButton]!

    // MARK - Properties
    var exercise: Exercise?

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

    //MARK: Actions
    @IBAction func buttonActionTouchUpInside(_ button: UIButton) {
        switch button.tag {
        case 1:
            let baiTap2 = BaiTap2ViewController()
            navigationController?.pushViewController(baiTap2, animated: true)
        case 2:
            let baiTap22 = BaiTap22ViewController()
            navigationController?.pushViewController(baiTap22, animated: true)
        default:
            break
        }
    }
}
