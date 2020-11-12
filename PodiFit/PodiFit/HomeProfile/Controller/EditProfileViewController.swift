//
//  EditProfileViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 27/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var profileView: UIImageView!
    
    @IBOutlet var editProfileButton: UIButton!
    
    var tempDataToEdit = [UserDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 5
        editProfileButton.layer.cornerRadius = 5
        
        saveButton.backgroundColor = Colors.yellowColor
        view.backgroundColor = Colors.backgroundBaseColor
        
        setUITextField(sender: nameTextField)
        setUITextField(sender: weightTextField)
        setUITextField(sender: heightTextField)
        
        hideKeyboardWhenTappedAround()
        
        notifHelper.configureUserNotificationCenter()
        
    }
    
    @IBAction func editProfileAction(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction) in
            
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        profileView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if nameTextField.text == "" {
            showAlert(messageToDisplay: "Name text field can't be empty")
            return false
        }
        if weightTextField.text == "" {
            showAlert(messageToDisplay: "weight text field can't be empty")
            return false
        }
        if heightTextField.text == "" {
            showAlert(messageToDisplay: "height text field can't be empty")
            return false
        }
        
        userHelper.updateUserImage(nameToUpdate: tempDataToEdit[0].Name!, image: (profileView.image?.pngData())!)
        
        userHelper.updateUserData(userNameToUpdate: tempDataToEdit[0].Name!, newName: nameTextField.text!, height: Int(heightTextField.text!)!, weight: Int(weightTextField.text!)!)
        
        return true
    }
    @IBAction func saveAction(_ sender: Any) {
       
    }
    
    @IBAction func editProfilePictureAction(_ sender: Any) {
    }
    
    func setUITextField(sender: UITextField)
    {
        sender.backgroundColor = .clear
        sender.layer.borderColor = Colors.yellowColor.cgColor
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 5
    }
    
    func showAlert(messageToDisplay: String) {
          let alert = UIAlertController(title: "Message", message: messageToDisplay, preferredStyle: .alert)
          let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
          alert.addAction(action)
          self.present(alert, animated: true, completion: nil)
      }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        
        nameTextField.text = tempDataToEdit[0].Name
        heightTextField.text = "\(tempDataToEdit[0].height!)"
        weightTextField.text = "\(tempDataToEdit[0].weight!)"
        profileView.image = UIImage(data: tempDataToEdit[0].img)
    }
    

}
