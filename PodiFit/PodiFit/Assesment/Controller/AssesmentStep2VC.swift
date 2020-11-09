//
//  AssesmentStep2VC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class AssesmentStep2VC: UIViewController {
    
    var gender: String = ""
    var weight: String = ""
    var height: String = ""
    var times: String = ""

    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    @IBAction func firstSelBtn(_ sender: Any) {
        if firstBtn.isSelected{
            firstBtn.isSelected = false
            firstBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
        else {
            firstBtn.isSelected.toggle()
            times = "2"
            firstBtn.layer.backgroundColor = Colors.yellowColor.cgColor
            unSelected(status: "1")
        }
    }
    
    @IBAction func secSelBtn(_ sender: Any) {
        if secondBtn.isSelected{
            secondBtn.isSelected = false
            secondBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
        else {
            secondBtn.isSelected.toggle()
            times = "3"
            secondBtn.layer.backgroundColor = Colors.yellowColor.cgColor
            unSelected(status: "2")
        }
    }
    
    @IBAction func thirdSelBtn(_ sender: Any) {
        if thirdBtn.isSelected{
            thirdBtn.isSelected = false
            thirdBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
        else {
            thirdBtn.isSelected.toggle()
            times = "4"
            thirdBtn.layer.backgroundColor = Colors.yellowColor.cgColor
            unSelected(status: "3")
        }
    }
    
    @IBAction func fouthSelBtn(_ sender: Any) {
        if fourthBtn.isSelected{
            fourthBtn.isSelected = false
            fourthBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        }
        else {
            fourthBtn.isSelected.toggle()
            times = "5"
            fourthBtn.layer.backgroundColor = Colors.yellowColor.cgColor
            unSelected(status: "4")
        }
    }
    
    func unSelected(status: String) {
        switch status {
        case "1":
            secondBtn.isSelected = false
            secondBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            thirdBtn.isSelected = false
            thirdBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            fourthBtn.isSelected = false
            fourthBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        case "2" :
            firstBtn.isSelected = false
            firstBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            thirdBtn.isSelected = false
            thirdBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            fourthBtn.isSelected = false
            fourthBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        case "3" :
            firstBtn.isSelected = false
            firstBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            secondBtn.isSelected = false
            secondBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            fourthBtn.isSelected = false
            fourthBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        case "4" :
            firstBtn.isSelected = false
            firstBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            secondBtn.isSelected = false
            secondBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
            thirdBtn.isSelected = false
            thirdBtn.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.337254902, blue: 0.337254902, alpha: 1)
        default:
            firstBtn.isSelected = false
            secondBtn.isSelected = false
            thirdBtn.isSelected = false
            fourthBtn.isSelected = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? AssesmentResultVC {
            target.gender = gender
            target.weight = weight
            target.height = height
            target.times = times
        }
    }
    
    func setupUI() {
        firstBtn.layer.borderWidth = 2
        firstBtn.layer.borderColor = Colors.yellowColor.cgColor
        firstBtn.layer.cornerRadius = 7

        secondBtn.layer.borderWidth = 2
        secondBtn.layer.borderColor = Colors.yellowColor.cgColor
        secondBtn.layer.cornerRadius = 7
        
        thirdBtn.layer.borderWidth = 2
        thirdBtn.layer.borderColor = Colors.yellowColor.cgColor
        thirdBtn.layer.cornerRadius = 7
        
        fourthBtn.layer.borderWidth = 2
        fourthBtn.layer.borderColor = Colors.yellowColor.cgColor
        fourthBtn.layer.cornerRadius = 7
    }

    

}
