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

    @objc private func doneSelectedButton() {
        var actions: [UIAlertAction] = []
        let okayAction = UIAlertAction(title: "Okay",
                                       style: UIAlertAction.Style.default,
                                       handler: {(alert: UIAlertAction!) in self.deleteSelected()})
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: UIAlertAction.Style.cancel,
                                         handler: nil)
        actions.append(okayAction)
        actions.append(cancelAction)
        super.alertSettings(title: "Delete Confirm", message: "Do you want delete this choosen!", actions: actions)
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
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(contact.avatarImg)
        if fileManager.fileExists(atPath: imagePath) {
            cell?.avatarImageView.image = UIImage(contentsOfFile: imagePath)
            cell?.avatarImageView.contentMode = .scaleAspectFill
        } else{
            cell?.avatarImageView.image = UIImage(named: contact.avatarImg)
        }
//        cell?.avatarImageView.image = UIImage(named: contact.avatarImg)
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
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath.init(row: indexPath.row, section: indexPath.section)], with: .automatic)
            tableView.endUpdates()
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
                tableView.beginUpdates()
                tableView.reloadRows(at: [IndexPath.init(row: indexContact, section: 0)], with: .automatic)
                tableView.endUpdates()
            }
        case .add:
            if let contact = contact {
                contactList.insert(contact, at: 0)
                tableView.beginUpdates()
                tableView.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: .automatic)
                tableView.endUpdates()
            }
        case .delete:
            contactList.remove(at: indexContact)
            tableView.beginUpdates()
            tableView.deleteRows(at: [IndexPath.init(row: indexContact, section: 0)], with: .automatic)
            tableView.endUpdates()
        }
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
