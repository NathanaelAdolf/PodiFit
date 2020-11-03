//
//  AssesmentResultVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class AssesmentResultVC: UIViewController {
    
    var gender: String = ""
    var weight: String = ""
    var height: String = ""
    var times: String = ""

    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var planLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()

        // Do any additional setup after loading the view.
    }
    
    func setupData() {
        genderImage.image = UIImage(named: gender)
        genderLabel.text = gender
        weightLabel.text = weight
        heightLabel.text = height
        timeLabel.text = times
    }
    
}
