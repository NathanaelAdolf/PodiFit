//
//  AssesmentResultVC.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

let insertData = DefaultDataHelper()

class AssesmentResultVC: UIViewController {
    
    var gender: String = ""
    var weight: String = ""
    var height: String = ""
    var times: String = ""
    
    var myHeight: Int = 0
    var myWeight: Int = 0
    var myTimes: Int = 0

    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var planLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    @IBAction func seeMyPlanBtn(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "first")
        UserDefaults.standard.synchronize()
        
        insertData.storeDefaultPlanData()
        insertData.storeDefaultDifficulty()
        insertData.storeDefaultExerciseAndExerciseStepsData()
        
        userHelper.storeToUserData(idUser: 0, userName: "User PodiFit", idPlan: [1], height: myHeight, weight: myWeight, img: (UIImage(named: "person image.png")?.pngData())!) // Nanti Dihapus array idPlan
        
        self.performSegue(withIdentifier: "SeeMyPlanSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? PlanOverviewViewController {
            target.jumlahHari = myTimes
        }
    }
    
    func setupData() {
        genderImage.image = UIImage(named: gender)
        genderLabel.text = gender
        weightLabel.text = weight
        heightLabel.text = height
        timeLabel.text = times
        
        myHeight = Int(height)!
        myWeight = Int(weight)!
        myTimes = Int(times)!
    }
    
}
