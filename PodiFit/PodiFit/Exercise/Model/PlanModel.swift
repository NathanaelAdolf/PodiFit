//
//  PlanModel.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

class PlanModel {
    var chosenExercise : [Int]?
    var durasiPlan : Int!
    var durasiSession : Int!
    var idDifficulty : Int!
    var idPlan : Int!
    var namaPlan : String!
    
    
    init(chosenExercise: [Int]?, durasiPlan : Int, durasiSession : Int, idDifficulty: Int, idPlan: Int, namaPlan : String){
        self.chosenExercise = chosenExercise
        self.durasiPlan = durasiPlan
        self.durasiSession = durasiSession
        self.idDifficulty = idDifficulty
        self.idPlan = idPlan
        self.namaPlan = namaPlan
    }
}
