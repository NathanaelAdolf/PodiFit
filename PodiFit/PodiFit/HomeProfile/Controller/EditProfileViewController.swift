//
//  EditProfileViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 27/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var profileView: UIView!
    
    var tempDataToEdit = [UserDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 5
        saveButton.backgroundColor = Colors.yellowColor
        view.backgroundColor = Colors.backgroundBaseColor
        
        setUITextField(sender: nameTextField)
        setUITextField(sender: weightTextField)
        setUITextField(sender: heightTextField)
        
        notifHelper.configureUserNotificationCenter()
        
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
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
