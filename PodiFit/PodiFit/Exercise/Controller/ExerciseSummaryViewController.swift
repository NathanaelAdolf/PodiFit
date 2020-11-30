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
    var idPlanActive : Int!
    var statusToBadgeViewController : Int!
    
    
    
    @IBOutlet weak var  exerciseSummaryView : ExerciseSummaryView!
    
    let reviewService = ReviewService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AppUtility.lockOrientation(.portrait)

        exerciseSummaryView.tableView.delegate = self
        exerciseSummaryView.tableView.dataSource = self
        print("ini data idplan \(idPlanActive)")
    }
    
    
    @IBAction func tiredBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func neutralBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    @IBAction func energizedBtn(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func finishSummary(_ sender: Any) {
        
        if badgesHelper.isBadgesTableEmpty()  == true {
            badgesHelper.storeToBadgesData(id: 1, complete5Plan: false, completePlan: false, customExercise: false, exerciseAddict: false, exerciseMaster: false, firstTimeBadge: false, reminderBadge: false)
            
        }
        // check apakah pertama kali olah raga
        if badgesHelper.checkFirstTimeExercise() == false {
            statusToBadgeViewController = 1
            badgesHelper.updateFirstTimeIntoTrue(isBadgesDone: true)
            self.performSegue(withIdentifier: "toClaimBadge", sender: nil)
        }
        // check table badges completed plan sudah belum
        else if badgesHelper.checkPlanIsDoneInTablePlan(idPlan: idPlanActive) == true && badgesHelper.checkCompletedPlanBadgeInTableBadges() == false {
            statusToBadgeViewController = 2
            badgesHelper.updateCompletePlanIntoTrue(isBadgesDone: true)
            self.performSegue(withIdentifier: "toClaimBadge", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "toMainFromSummary", sender: nil)
        }

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClaimBadge"{
            let destination = segue.destination as! BadgeViewController
            destination.status = statusToBadgeViewController
        }
//        else if segue.identifier == "toMainFromSummary" {
//            let destination = segue.destination as!
//        }
        
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
            var label : String = ""
            let tempDetikExercise = totalWaktuExercise % 60
            let tempMenitExercise = totalWaktuExercise / 60
            
            if tempMenitExercise != 0 {
                label = "Minutes"
            } else if tempDetikExercise != 0 {
                label = "Seconds"
            }
            
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
            
            
            
            
            cell.setView(menitExercise: menitExercise, detikExercise: detikExercise, label : label)
            
            
            return cell
        } else {
            let cellEmot = tableView.dequeueReusableCell(withIdentifier: "emoticonCell") as! EmoticonTableViewCell
            cellEmot.tiredDidTap()
            
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
