//
//  ExerciseSummaryView.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 02/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ExerciseSummaryView: UIView {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewTimeSummary: UIView!
    @IBOutlet weak var viewMinute: UIView!
    @IBOutlet weak var viewSecond: UIView!
    
    @IBOutlet weak var minuteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setInitialView()
    }

    func setview() {
        
    }
    
    func setInitialView(){
        tableView.estimatedRowHeight = 293
    }
    
}
