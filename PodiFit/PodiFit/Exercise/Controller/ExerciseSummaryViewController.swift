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
//        print("ini total di exeSummaryview\(totalWaktuExercise)")
        calculateSummary(totalWaktuExercise : totalWaktuExercise)
        
    }
    
    func calculateSummary(totalWaktuExercise : Int) {
        var detikExercise = totalWaktuExercise % 60
        var menitExercise = totalWaktuExercise / 60
        print("ini summary nya \(menitExercise) : \(detikExercise)")
        
//        exerciseSummaryView.setview(menitExercise : menitExercise, detikExercise : detikExercise)
    }
    
    @IBAction func finishSummary(_ sender: Any) {
        self.performSegue(withIdentifier: "toClaimBadge", sender: nil)
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
