//
//  HomeViewController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var personInfoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingLayout()
    }
    @IBAction func doLogoutButtonClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func doEditButtonClick(_ sender: Any) {
        let editInformation = EditInformationViewController()
        navigationController?.pushViewController(editInformation, animated: true)
    }
    
    /**
     * Check catching monkey's ball.
     */
    fileprivate func checkItemType(item: UIView) -> Bool {
        for checkItem in personInfoView.subviews {
            if (item == checkItem) {
                return true
            }
        }
        return false
    }

    /**
     * Setting layout avatar.
     */
    private func settingLayout() {
        let persons = BusinessController.share.getPersonsInfo()
        if persons.isEmpty {
            return
        }
        
        let leftMargin = 25
        let topMargin = 150
        var x:Int = leftMargin
        var y:Int = 50

        let maxWidth = Int(UIScreen.main.bounds.size.width)
        let viewH = 130
        let viewW = 100
        // Calculate to display.
        for person in persons {
            let locate = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: viewW, height: viewH))
            addComponent(person: person, point: locate)

            // Move to new point.
            x += viewW + leftMargin
            if (x + viewW > maxWidth) {
                x = leftMargin
                y += topMargin
            }
        }
    }

    /**
     * Add person information to home page.
     */
    func addComponent(person personInfo: PersonInfo, point localtion: CGRect) {

        guard let nib = Bundle.main.loadNibNamed(CommonConstant.IMAGE_NAME, owner: nil, options: nil)?[0] as? AvatarItemView else { return }
        nib.setting(person: personInfo)
        nib.frame = localtion
        nib.delegate = self
        personInfoView.addSubview(nib)
    }
}

extension HomeViewController: AvatarItemViewDelegate {
    
    func view(_ view: AvatarItemView, didSelect index: String?) {
            UserDefaults.standard.set(index, forKey: CommonConstant.PROFILE_ID)
            UserDefaults.standard.synchronize()
            navigationController?.pushViewController(PersonDetailViewController(), animated: true)
    }
}
