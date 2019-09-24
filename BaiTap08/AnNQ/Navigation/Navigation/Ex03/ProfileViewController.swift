//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MBA0217 on 9/19/19.
//  Copyright © 2019 MBA0217. All rights reserved.
//

import UIKit
import Photos

protocol ProfileViewControllerDelegate : class {
    func changeDataInUIVIew(value: User, index: Int)
}



class ProfileViewController: UIViewController {

    var user: User?
    var index = 0
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var avatarView: UIImageView!
    weak var delegate: ProfileViewControllerDelegate?
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
        if let user = self.user {
            nameTextField.text = user.name
           avatarView.image = UIImage(named: user.avatar)
           tapGestureRecognizer(avatarView)
        } else {
            return
        }
    }

    private func tapGestureRecognizer(_ container: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatartapGestureRecognizer(_:)))
        container.addGestureRecognizer(tapGesture)
        container.isUserInteractionEnabled = true
    }
    
    @objc private func avatartapGestureRecognizer(_ sender : UITapGestureRecognizer ) {
        guard sender.view != nil else { return }
        
        if sender.state == .ended {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
                
            present(imagePicker, animated: true, completion: nil)
        }

    }
    
    @objc func updateProfile () {
        if nameTextField.text != "" {
            user!.name = nameTextField.text!
        }
        if let delegate = self.delegate {
            delegate.changeDataInUIVIew(value: user!, index: self.index)
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

            user!.avatar = assetResources.first!.originalFilename
           }
            picker.dismiss(animated: true, completion: nil)
       }
    }
}

