//
//  Assesment.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 21/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import UserNotifications

class AssesmentStep1VC: UIViewController{
    var gender: String = ""
    
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTextFields()
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        if (gender.isEmpty == true || weightTextField.text?.isEmpty == true || heightTextField.text?.isEmpty == true){
                alertLabel.isHidden = false
        }
        else {
            self.performSegue(withIdentifier: "NextStepSegue", sender: self)
        }
    }
    
    @IBAction func maleSelectedBtn(_ sender: Any) {
        if maleBtn.isSelected {
            maleBtn.isSelected = false
            maleBtn.layer.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
        else {
            maleBtn.isSelected.toggle()
            gender = "Male"
            maleBtn.layer.backgroundColor = Colors.yellowColor.cgColor
            femaleBtn.isSelected = false
            femaleBtn.layer.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
    }
    
    @IBAction func femaleSelectedBtn(_ sender: Any) {
        if femaleBtn.isSelected {
            femaleBtn.isSelected = false
            femaleBtn.layer.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
        else {
            femaleBtn.isSelected.toggle()
            gender = "Female"
            femaleBtn.layer.backgroundColor = Colors.yellowColor.cgColor
            maleBtn.isSelected = false
            maleBtn.layer.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
    }
    
    func setupTextFields() {
            let toolbar = UIToolbar()
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                             target: self, action: #selector(doneButtonTapped))
            
            toolbar.setItems([flexSpace, doneButton], animated: true)
            toolbar.sizeToFit()
            
            weightTextField.inputAccessoryView = toolbar
            heightTextField.inputAccessoryView = toolbar
        }
        
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? AssesmentStep2VC {
            target.gender = gender
            target.weight = weightTextField.text!
            target.height = heightTextField.text!
        }
    }
    
    func setupUI() {
        maleBtn.layer.borderWidth = 2
        maleBtn.layer.borderColor = Colors.yellowColor.cgColor
        maleBtn.layer.cornerRadius = 60
        
        femaleBtn.layer.borderWidth = 2
        femaleBtn.layer.borderColor = Colors.yellowColor.cgColor
        femaleBtn.layer.cornerRadius = 60
        
        weightTextField.layer.borderWidth = 2
        weightTextField.layer.borderColor = Colors.yellowColor.cgColor
        weightTextField.layer.cornerRadius = 10
        weightTextField.keyboardType = UIKeyboardType.numberPad
        
        heightTextField.layer.borderWidth = 2
        heightTextField.layer.borderColor = Colors.yellowColor.cgColor
        heightTextField.layer.cornerRadius = 10
        heightTextField.keyboardType = UIKeyboardType.numberPad
    }
}
