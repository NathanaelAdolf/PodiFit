//
//  PlansModel.swift
//  PodiFit
//
//  Created by Hafizul Ihsan Fadli on 12/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation

class PlansModel {
    var chosenExercise: [Int]?
    var desc: String?
    var durasiPlan: Int32
    var durasiSessionDay: Int64
    var idDifficulty: Int32
    var idPlan: Int32
    var isPlanDone: Bool
    var jumlahHari: Int32
    var namaPlan: String?
    var totalSessionDone: Int32
    var exercise: NSSet?
    
    
    init(chosenExercise: [Int]?, desc: String?, durasiPlan: Int32, durasiSessionDay: Int64, idDifficulty: Int32, idPlan: Int32, isPlanDone: Bool, jumlahHari: Int32, namaPlan: String?, totalSessionDone: Int32, exercise: NSSet?){
        self.chosenExercise = chosenExercise
        self.desc = desc
        self.durasiPlan = durasiPlan
        self.durasiSessionDay = durasiSessionDay
        self.idDifficulty = idDifficulty
        self.idPlan = idPlan
        self.isPlanDone = isPlanDone
        self.jumlahHari = jumlahHari
        self.namaPlan = namaPlan
        self.totalSessionDone = totalSessionDone
        self.exercise = exercise
    }
}
