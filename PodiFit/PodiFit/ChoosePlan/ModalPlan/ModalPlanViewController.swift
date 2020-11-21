//
//  ModalPlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 03/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit
import CoreData

class ModalPlanViewController: UIViewController {
    
    @IBOutlet weak var infoVideo: WKWebView!
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var exerciseSteps: UILabel!
    
    let CustomizePlanHelper = CustomizePlanModel()
    var idMovement = Int()
    var exerciseInfo = String()
    var exerciseStep = [StepModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exerciseName.text = CustomizePlanHelper.getExercise(idExercise: idMovement)!.namaExercise
        exerciseStep = CustomizePlanHelper.fetchIdSteps(idExercise: idMovement)
        parseData()
        
        self.view.backgroundColor = UIColor.init(patternImage: UIImage(named: "plan_bg")!)
        

        infoVideo.loadHTMLString("<iframe width=\"100%%\" height=\"100%%\" src=\"\(CustomizePlanHelper.getExercise(idExercise: idMovement)!.videoUrl)?&rel=0\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: URL(string: "\(CustomizePlanHelper.getExercise(idExercise: idMovement)!.videoUrl)"))
        
        // Do any additional setup after loading the view.
    }
    
    func parseData() {
        var tempData : String = ""

        for i in 0...(exerciseStep.count - 1) {
            if(i == (exerciseStep.count - 1)){
                tempData.append("\(i+1). \(exerciseStep[i].steps!)")
            }
            else{
                tempData.append("\(i+1). \(exerciseStep[i].steps!)\n\n")
            }
            
        }
        // send data to view
        exerciseSteps.text = tempData
//        informationExerciseView.setupView(data : tempData, namaExercise : namaExercise)
        
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
