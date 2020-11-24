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
    

    
    func setSummaryView(menitExercise : Int, detikExercise : Int) {
//        minutesSummaryLbl.text =
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setView(menitExercise : String, detikExercise : String) {
        print(menitExercise)
        minutesSummaryLbl.text = menitExercise
        secondsSummaryLbl.text = detikExercise
    }
}

class ExerciseSummaryView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var gambarSuram: UIButton!
    @IBOutlet weak var viewMinute: UIView!
    @IBOutlet weak var viewSecond: UIView!
    
    @IBOutlet weak var minutesSummaryLbl: UILabel!
    @IBOutlet weak var secondsSummaryLbl: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInitialView()
        
    }

    
    
    func setInitialView(){
        tableView.estimatedRowHeight = 293
    }
    
    
    
}
