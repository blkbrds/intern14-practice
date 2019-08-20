//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Nguyen Duong on 8/17/19.
//  Copyright © 2019 Nguyen Duong. All rights reserved.
//

import UIKit

class ContactListViewController: AlertsVC {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var contactList: [Contact] = []
    var isSelected: Bool = false
//    var editedContact: Contact = Contact()
    var indexContact: Int = 0

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setUpUI()
        configData()
    }

    // MARK: - Custom func

    private func configData() {
        contactList = FileManagers.share.getContacts(fileName: "contactList", type: "plist")
    }

    private func configTableView() {
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setUpUI() {
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteItems))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItems))
        navigationItem.leftBarButtonItem = deleteButton
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func deleteItems() {
        tableView.isEditing = true
        isSelected = !isSelected
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelSelected))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneSelectedButton))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc private func cancelSelected() {
        tableView.isEditing = false
        isSelected = !isSelected
        setUpUI()
    }

    private func deleteSelected() {
        isSelected = !isSelected
        if let selectedRows = tableView.indexPathsForSelectedRows {
            var items = [Int]()
            for indexPath in selectedRows  {
                items.append(indexPath.row)
            }
            let listRemove = items.sorted(by: {(a, b) -> Bool in
                return a > b
            })
            for index in listRemove {
                contactList.remove(at: index)
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
            tableView.isEditing = false
            setUpUI()
        }
    }

    @objc private func doneSelectedButton() {
//        super.alertSettings(title: "Delete Warning", message: "Do you want to delete this rows selected!", alertButtons: [AlertButton(name: "Cancel",style: .cancel , handle: nil), AlertButton(name: "Okey",style: .defauls , handle: self.deleteSelected())])
        let alert = UIAlertController(title: "Delete Warning",
                                      message: "Do you want to delete this rows selected!",
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Okay",
                                      style: UIAlertAction.Style.default,
                                      handler: {(alert: UIAlertAction!) in self.deleteSelected()}))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertAction.Style.cancel,
                                      handler: nil))
        self.present(alert, animated: true)
    }

    @objc private func addItems() {
        let vc = DetailViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - Extensions
extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ContactCell
        let contact = contactList[indexPath.row]
        let calendar = Calendar.current
        let date = Date()
        cell?.avatarImageView.image = UIImage(named: contact.avatarImg)
        cell?.fullNameLabel.text = contact.fullName
        cell?.addressLabel.text = contact.address
        if contact.gender {
            cell?.sexAndAgeLabel.text = "Male, \(calendar.component(.year, from: date) - calendar.component(.year, from: contact.dateOfBirth)) years old"
        } else {
            cell?.sexAndAgeLabel.text = "Female, \(calendar.component(.year, from: date) - calendar.component(.year, from: contact.dateOfBirth)) years old"
        }
        cell?.phoneLabel.text = contact.phone
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isSelected {
            let contact = contactList[indexPath.row]
            indexContact = indexPath.row
            let detailVC = DetailViewController()
            detailVC.delegate = self
            detailVC.avatarImg = contact.avatarImg
            detailVC.email = contact.email
            detailVC.fullName = contact.fullName
            detailVC.address = contact.address
            detailVC.phone = contact.phone
            detailVC.dateOfBirth = contact.dateOfBirth
            detailVC.gender = contact.gender
            detailVC.isHidden = false
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }

//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject =  contactList[sourceIndexPath.row]
        contactList.remove(at: sourceIndexPath.row)
        contactList.insert(movedObject, at: destinationIndexPath.row)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none:
            return
        case .delete:
            contactList.remove(at: indexPath.row)
            tableView.reloadData()
        case .insert:
            return
        }
        
    }
}

extension ContactListViewController: DetailViewControllerDelegate {
    func detailView(view: DetailViewController, needPerform action: DetailViewController.Action, contact: Contact?) {
        switch action {
        case .edit:
            if let contact = contact {
                contactList[indexContact] = contact
            }
        case .add:
            if let contact = contact {
                contactList.insert(contact, at: 0)
            }
        case .delete:
            contactList.remove(at: indexContact)
        }
        tableView.reloadData()
    }
}
// MARK: - IBDesignable
@IBDesignable extension UIImageView {

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

@IBDesignable extension UIButton {

    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }

}

@IBDesignable extension UITextField {

    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }

}
