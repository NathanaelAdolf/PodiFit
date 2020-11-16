//
//  ExerciseModel.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation


class ExerciseModel {
    var idDifficulty : Int
    var idExercise : Int
    var listIdSteps: [Int]?
    var namaExercise: String
    var videoUrl: String
    var image: String
    var warningData: [Int]?
    
    
    init(idDifficulty: Int, idExercise : Int, listIdSteps: [Int]?, namaExercise: String, videoUrl: String, image: String, warningData: [Int]?){
        self.idDifficulty = idDifficulty
        self.idExercise = idExercise
        self.listIdSteps = listIdSteps
        self.namaExercise = namaExercise
        self.videoUrl = videoUrl
        self.image = image
        self.warningData = warningData
        
    }
}
