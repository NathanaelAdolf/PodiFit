//
//  CompletedPlanModel.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

class CompletedPlanModel {
    
    var titleMovement: String!
    var level: String!
    var period: Int!
    
    init(titleMovement: String, level: String, period: Int) {
        self.titleMovement = titleMovement
        self.level = level
        self.period = period
    }
    
}
