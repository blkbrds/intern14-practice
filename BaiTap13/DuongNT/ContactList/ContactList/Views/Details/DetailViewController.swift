//
//  DetailViewController.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/18/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func detailView(view: DetailViewController, needPerform action: DetailViewController.Action, contact: Contact?)
}

class DetailViewController: AlertsVC {

    // MARK: - Enums
    enum Action {
        case edit
        case add
        case delete
    }

    // MARK: - Outlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var fullNameTextField: UITextField!
    @IBOutlet private weak var addressTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var dateOfBirthTextField: UITextField!
    @IBOutlet private weak var genderTextField: UITextField!
    @IBOutlet private weak var deleteButton: UIButton!

    // MARK: - Properties
    weak var delegate: DetailViewControllerDelegate?
    var avatarImg: String?
    var email: String?
    var fullName: String?
    var address: String?
    var phone: String?
    var dateOfBirth: Date = Date()
    var gender: Bool = true
    var isHidden: Bool = true
    let imagePicker = UIImagePickerController()
    var viewController: UIViewController?
    var datePicker: MyDatePickerView?
    var genderPicker: GenderPickerView?
    var indexImage: Int = 0

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields()
        imagePicker.delegate = self
        setUpUI()
    }

    // MARK: - Basic override view function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - Custom func
    private func configTextFields() {
        emailTextField.delegate = self
        fullNameTextField.delegate = self
        addressTextField.delegate = self
        phoneTextField.delegate = self
        dateOfBirthTextField.delegate = self
        genderTextField.delegate = self
    }

    func isValidEmail(email: String?) -> Bool {
        if let email = email {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: email)
            return result
        }
        return false
    }

    private func isValidString(string: String) -> Bool {
        return !string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && string.count >= 6 && string.count <= 32
    }

    private func isValidPhoneNumber(value: String) -> Bool {
        let phoneRegEx = "^((\\+[0-9]{2,12}$))||[0-9]{6,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let result =  phoneTest.evaluate(with: value)
        return result
    }

    private func setUpUI() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAddButton))
        navigationItem.rightBarButtonItem = doneButton
        let format = DateFormatter()
        format.dateFormat = "MMM d, YYYY"
        avatarImageView.image = UIImage(named: avatarImg ?? "avatarDefault")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        emailTextField.text = email
        fullNameTextField.text = fullName
        addressTextField.text = address
        phoneTextField.text = phone
        let formattedDate = format.string(from: dateOfBirth)
        dateOfBirthTextField.text = "\(formattedDate)"
        if gender {
            genderTextField.text = "Male"
        } else {
            genderTextField.text = "Female"
        }
        deleteButton.isHidden = isHidden
    }

    @objc func doneAddButton() {
        if deleteButton.isHidden {
            delegate?.detailView(view: self, needPerform: .add, contact: Contact(avatarImg: avatarImg ?? "avatarDefault", email: emailTextField.text ?? "", fullName: fullNameTextField.text ?? "", address: addressTextField.text ?? "", phone: phoneTextField.text ?? "", dateOfBirth: self.dateOfBirth, gender: self.gender))
        } else {
            delegate?.detailView(view: self, needPerform: .edit, contact: Contact(avatarImg: avatarImg ?? "avatarDefault", email: emailTextField.text ?? "", fullName: fullNameTextField.text ?? "", address: addressTextField.text ?? "", phone: phoneTextField.text ?? "", dateOfBirth: self.dateOfBirth, gender: self.gender))
        }
        navigationController?.popViewController(animated: true)
    }

    @objc private func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    private func deleteContact() {
        delegate?.detailView(view: self, needPerform: .delete, contact: nil)
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Actions
    @IBAction func deleteButtonAction(_ button: UIButton) {
        var actions: [UIAlertAction] = []
        let okayAction = UIAlertAction(title: "Okay",
                                       style: UIAlertAction.Style.default,
                                       handler: {(alert: UIAlertAction!) in self.deleteContact()})
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: UIAlertAction.Style.cancel,
                                         handler: nil)
        actions.append(okayAction)
        actions.append(cancelAction)
        super.alertSettings(title: "Delete Confirm", message: "Do you want delete this contact!", actions: actions)
    }

    @IBAction func dateOfBirthTouchUpInside(_ button: UIButton) {
        datePicker = Bundle.main.loadNibNamed("MyDatePickerView", owner: self, options: nil)?.first as? MyDatePickerView
        datePicker?.config()
        datePicker?.delegate = self
        self.view.addSubview(datePicker!)
        datePicker?.show(animation: true)
    }

    @IBAction func genderTouchUpInside(_ button: UIButton) {
        genderPicker = Bundle.main.loadNibNamed("GenderPickerView", owner: self, options: nil)?.first as? GenderPickerView
        genderPicker?.config()
        genderPicker?.delegate = self
        self.view.addSubview(genderPicker!)
        genderPicker?.show(animation: true)
    }
}

// MARK: - Extension
extension DetailViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            if !isValidEmail(email: emailTextField.text) {
                var actions: [UIAlertAction] = []
                let okayAction = UIAlertAction(title: "Okay",
                                               style: UIAlertAction.Style.default,
                                               handler: {(alert: UIAlertAction!) in self.emailTextField.becomeFirstResponder()})
                actions.append(okayAction)
                super.alertSettings(title: "Confirm Email", message: "Pls check format email!", actions: actions)
            } else {
                fullNameTextField.becomeFirstResponder()
            }
        } else if textField == fullNameTextField {
            if let fullName = fullNameTextField.text {
                if isValidString(string: fullName) {
                    addressTextField.becomeFirstResponder()
                } else {
                    var actions: [UIAlertAction] = []
                    let okayAction = UIAlertAction(title: "Okay",
                                                   style: UIAlertAction.Style.default,
                                                   handler: {(alert: UIAlertAction!) in self.fullNameTextField.becomeFirstResponder()})
                    actions.append(okayAction)
                    super.alertSettings(title: "Confirm Full Name", message: "Fullname không chứa ký tự rỗng, chứa từ 6 đến 32 ký tự", actions: actions)
                }
            }
        } else if textField == addressTextField {
            if let address = addressTextField.text {
                if isValidString(string: address) {
                    phoneTextField.becomeFirstResponder()
                } else {
                    var actions: [UIAlertAction] = []
                    let okayAction = UIAlertAction(title: "Okay",
                                                   style: UIAlertAction.Style.default,
                                                   handler: {(alert: UIAlertAction!) in self.addressTextField.becomeFirstResponder()})
                    actions.append(okayAction)
                    super.alertSettings(title: "Confirm Address", message: "Address không chứa ký tự rỗng, chứa từ 6 đến 32 ký tự", actions: actions)
                }
            }
        } else if textField == phoneTextField {
            if let phone = phoneTextField.text {
                if isValidPhoneNumber(value: phone) {
                    phoneTextField.resignFirstResponder()
                } else {
                    var actions: [UIAlertAction] = []
                    let okayAction = UIAlertAction(title: "Okay",
                                                   style: UIAlertAction.Style.default,
                                                   handler: {(alert: UIAlertAction!) in self.phoneTextField.becomeFirstResponder()})
                    actions.append(okayAction)
                    super.alertSettings(title: "Confirm Phone", message: "Pls check format phone!", actions: actions)
                }
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            if isValidEmail(email: emailTextField.text) {
                fullNameTextField.becomeFirstResponder()
            }
        } else if textField == fullNameTextField {
            if let fullName = fullNameTextField.text {
                if isValidString(string: fullName) {
                    addressTextField.becomeFirstResponder()
                }
            }
        } else if textField == addressTextField {
            if let address = addressTextField.text {
                if isValidString(string: address) {
                    phoneTextField.becomeFirstResponder()
                }
            }
        } else if textField == phoneTextField {
            if let phone = phoneTextField.text {
                if isValidPhoneNumber(value: phone) {
                    phoneTextField.resignFirstResponder()
                }
            }
        }
        return true
    }
}

extension DetailViewController: GenderPickerViewDelegate {
    func myGenderPicker(pickerView: GenderPickerView, needPerform action: GenderPickerView.Action, valueGenderPicker: Bool) {
        switch action {
        case .done:
            gender = valueGenderPicker
            if valueGenderPicker {
                genderTextField.text = "Male"
            } else {
                genderTextField.text = "Female"
            }
        case .cancel:
            break
        case .show:
            break
        case .hide:
            break
        }
    }
}

extension DetailViewController: MyDatePickerViewDelegate {
    func myDatePicker(pickerView: MyDatePickerView, needPerform action: MyDatePickerView.Action, selectedDate: Date?) {
        switch action {
        case .show:
            break
        case .hide:
            break
        case .cancel:
            break
        case .done:
            let format = DateFormatter()
            format.dateFormat = "MMM d, YYYY"
            let formattedDate = format.string(from: selectedDate ?? Date())
            dateOfBirth = selectedDate ?? Date()
            dateOfBirthTextField.text = "\(formattedDate)"
        }
    }
}

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            avatarImageView.contentMode = .scaleAspectFill
            avatarImageView.image = pickedImage
        }
        super.saveImageDocumentDirectory(avatarImageView: avatarImageView)
        avatarImg = super.getImage()[0]
        avatarImageView.image = UIImage(contentsOfFile: super.getImage()[1])
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
