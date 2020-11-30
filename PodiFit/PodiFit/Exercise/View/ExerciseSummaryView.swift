//
//  ExerciseSummaryView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class summaryTime: UITableViewCell {
    @IBOutlet weak var minutesSummaryLbl: UILabel!
    @IBOutlet weak var secondsSummaryLbl: UILabel!
    
    @IBOutlet weak var minutesOrSecondLbl: UILabel!
    
    @IBOutlet weak var backgroundMinuteView: UIView!
    @IBOutlet weak var backgroundSecondView: UIView!
    
    
    
    
    func setSummaryView(menitExercise : Int, detikExercise : Int) {
//        minutesSummaryLbl.text =
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setView(menitExercise : String, detikExercise : String, label : String) {
        backgroundMinuteView.layer.cornerRadius = 5
        backgroundSecondView.layer.cornerRadius = 5
        
        minutesSummaryLbl.text = menitExercise
        secondsSummaryLbl.text = detikExercise
        minutesOrSecondLbl.text = label
    }
}

class ExerciseSummaryView: UIView {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInitialView()
        finishButton.layer.cornerRadius = 7
        
    }

    
    
    func setInitialView(){
        tableView.estimatedRowHeight = 293
    }
    
    
    
}
