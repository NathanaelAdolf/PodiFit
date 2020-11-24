//
//  InformationExerciseController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 30/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class InformationExerciseController: UIViewController {
    
    @IBOutlet weak var informationExerciseView : InformationExercisionView!
//
//    @IBOutlet weak var stepsLabel: UILabel!
//    @IBOutlet weak var ExerciseNameLbl: UILabel!
    
    var tempStep = [StepModel]()
    var tempExerciseDetail = [ExerciseModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        parseData()
    }
    
    func parseData() {
        var tempData : String = ""
        var namaExercise = tempExerciseDetail[0].namaExercise
        
        for i in 0...(tempStep.count - 1) {
            tempData.append("\(i+1). \(tempStep[i].steps!)\n")
        }
        
        // send data to view
        informationExerciseView.setupView(data : tempData, namaExercise : namaExercise)
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
