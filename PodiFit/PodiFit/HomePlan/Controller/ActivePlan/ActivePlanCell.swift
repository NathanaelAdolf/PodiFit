//
//  ActivePlanCell.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ActivePlanCell: UICollectionViewCell {

    @IBOutlet weak var planImage: UIImageView!
    @IBOutlet weak var namePlanLabel: UILabel!
    @IBOutlet weak var weekPlanLabel: UILabel!
    @IBOutlet weak var exercisePlanLabel: UILabel!
    @IBOutlet weak var equipmentPlanLabel: UILabel!
    @IBOutlet weak var progressPlan: UIProgressView!
    @IBOutlet weak var progressPlanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        progressPlan.progress = 1
    }
    
    func parseData() {
        
    }

}
