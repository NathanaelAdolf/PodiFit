//
//  ActivePlanCell.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ActivePlanCell: UICollectionViewCell {

    @IBOutlet weak var progressPlan: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        progressPlan.progress = 1
    }

}
