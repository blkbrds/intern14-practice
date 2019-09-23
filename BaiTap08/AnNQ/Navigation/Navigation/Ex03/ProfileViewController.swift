//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit
import Photos

protocol ProfileDelegate {
    func changeDataInUIVIew(value: User, index: Int)
}



class ProfileViewController: UIViewController {

    var user = User(name: "", avatar: "")
    var index = 0
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var avatarView: UIImageView!
    var delegate: ProfileDelegate?
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        configUI()
    }
    
    func configUI () {
        title = "Profile"
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(updateProfile))
        navigationItem.rightBarButtonItem = doneButton
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.blue.cgColor
        nameTextField.setLeftPaddingPoints(10)
        nameTextField.layer.cornerRadius = 5
        nameTextField.text = user.name
        avatarView.image = UIImage(named: user.avatar)
        tapGestureRecognizer(avatarView)
    }

    private func tapGestureRecognizer(_ container: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        container.addGestureRecognizer(tapGesture)
        container.isUserInteractionEnabled = true
    }
    
    @objc private func tapAction(_ sender : UITapGestureRecognizer ) {
        guard sender.view != nil else { return }
        
        if sender.state == .ended {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
                
            present(imagePicker, animated: true, completion: nil)
        }

    }
    
    @objc func updateProfile () {
        if nameTextField.text != "" {
            user.name = nameTextField.text!
        }
        if let delegate = self.delegate {
            delegate.changeDataInUIVIew(value: user, index: self.index)
            navigationController?.popViewController(animated: true)
        } else {
            print("Error")
        }
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //choose file from gallery
                   if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                       avatarView.contentMode = .scaleAspectFit
                       avatarView.image = pickedImage

                       //get filename
                       if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset {
                           let assetResources = PHAssetResource.assetResources(for: asset)

                           user.avatar = assetResources.first!.originalFilename
                        print(user.avatar)
                       }
                    picker.dismiss(animated: true, completion: nil)
                   }
    }
}

