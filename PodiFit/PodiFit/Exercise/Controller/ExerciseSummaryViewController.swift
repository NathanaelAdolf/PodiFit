//
//  ExerciseSummaryViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit


class ExerciseSummaryViewController: UIViewController {
    var totalWaktuExercise : Int = 0
    

    @IBOutlet weak var  exerciseSummaryView : ExerciseSummaryView!
    
    let reviewService = ReviewService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        exerciseSummaryView.setInitialView()
        exerciseSummaryView.tableView.delegate = self
        exerciseSummaryView.tableView.dataSource = self    
    }
    
    
    
    @IBAction func finishSummary(_ sender: Any) {
        
        if badgesHelper.isBadgesTableEmpty()  == true {
            badgesHelper.storeToBadgesData(id: 1, complete5Plan: false, completePlan: false, customExercise: false, exerciseAddict: false, exerciseMaster: false, firstTimeBadge: false, reminderBadge: false)
            
        }
        
        
        if badgesHelper.checkFirstTimeExercise() == false {
            print("Masuk")
            badgesHelper.updateFirstTimeIntoTrue(isBadgesDone: true)
            self.performSegue(withIdentifier: "toClaimBadge", sender: nil)
        }
        else {
            print("Masuk ngga?")
            self.performSegue(withIdentifier: "toMainFromSummary", sender: nil)
        }

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let deadline = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadline) { [weak self] in
            self?.reviewService.requestReview()
        }
        
        
    }

}

extension ExerciseSummaryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "summaryTime") as! summaryTime
            var detikExercise : String = ""
            var menitExercise : String = ""
            let tempDetikExercise = totalWaktuExercise % 60
            let tempMenitExercise = totalWaktuExercise / 60
            if tempDetikExercise < 10 {
                detikExercise = "0\(tempDetikExercise)"
                print("ini detik di sum \(detikExercise)")
            }else {
                detikExercise = "\(tempDetikExercise)"
            }
            
            if tempMenitExercise < 10 {
                menitExercise = "0\(tempMenitExercise)"
            } else {
                menitExercise = "\(tempDetikExercise)"
            }
            cell.setView(menitExercise: menitExercise, detikExercise: detikExercise)
            return cell
        } else {
            let cellEmot = tableView.dequeueReusableCell(withIdentifier: "emoticonCell") as! EmoticonTableViewCell
            return cellEmot
        }
   
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 321
    }
    
    
}
