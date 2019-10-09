//
//  PersonDetailViewController.swift
//  PersonsManagement
//
//  Created by MBA0051 on 10/1/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var messageTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadProfileSelected()
    }

    fileprivate func loadProfileSelected() {
        guard let userId = UserDefaults.standard.object(forKey: CommonConstant.PROFILE_ID) else {
            return
        }
        guard let person = BusinessController.share.getPersonById(id: userId as! String) else {
            return
        }
        avatarImageView.image = person.personImage
        personNameTextField.text = person.personName
    }

    /**
     * Update information.
     */
    @IBAction func doDoneButtonClick(_ sender: Any) {
        guard let personName = personNameTextField.text, !personName.isEmpty else {
            messageTextField.text = "Username can not empty"
            return
        }
        
        guard let userId = UserDefaults.standard.object(forKey: CommonConstant.PROFILE_ID) else {
            return
        }
        
        guard let currentPerson = BusinessController.share.getPersonById(id: userId as! String) else {
            messageTextField.text = "Can't get person information."
            return
        }
        let updatePerson = PersonInfo(userId: currentPerson.userId, personImage: currentPerson.personImage, personName: personNameTextField.text!)
        
        if !BusinessController.share.updatePerson(person: updatePerson) {
            messageTextField.text = "Can't update current user."
            return
        }
        
        // Back to home page.
        goBackToHomePage()
    }
    
    @IBAction func doBackButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func goBackToHomePage() {
        navigationController?.popViewController(animated: true)
    }
}
