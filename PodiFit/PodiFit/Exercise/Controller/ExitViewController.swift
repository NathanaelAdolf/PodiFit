//
//  ExitViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 04/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ExitViewController: UIViewController {
    
    @IBOutlet weak var exitView : ExitView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        exitView.exitViewPopup()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func resumeExercise(_ sender: Any) {
        print("masuk")
        
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction func restartExercise(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toExit", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tocoba"{
            let destination = segue.destination as! ExerciseViewController
            destination.finishExercise = 0
        } else if segue.identifier == "toMain" {
            
        }  
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toInformationExercise" {
//            let destination = segue.destination as! InformationExerciseController
//            destination.tempStep = planModelHelpers.fetchIdSteps(idExercise: tempExerciseDetail[0].idExercise)
//            destination.tempExerciseDetail = planModelHelpers.fetchExerciseDetail(idExercise: tempExerciseDetail[0].idExercise)
//
//        } else if segue.identifier == "toSummary" {
//            let destination = segue.destination as! ExerciseSummaryViewController
//
//            destination.totalWaktuExercise = countTimeForSummary
//        }
//    }
    
    @IBAction func quitExercise(_ sender: Any) {
        self.performSegue(withIdentifier: "toMain", sender: nil)
    }
}
