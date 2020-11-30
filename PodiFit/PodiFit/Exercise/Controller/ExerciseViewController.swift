//
//  ExerciseViewController.swift
//  PodiFit
//
//  Created by Muhamad Vicky on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import WebKit
import CoreData


var planModelHelpers = PlanModel()

class ExerciseViewController: UIViewController {

    @IBOutlet weak var exerciseView : ExerciseView!
    @IBOutlet weak var circularProgressView : CircularProgressView!

    var count = 30
    var countTimeForSummary = 1
    var countTimeAddition = 5
    var timer: Timer?
    var isVideo: Int = 2
    var countChosenExercise = 3
    var finishExercise = 0
    var totalWaktuExercise : Int = 0
    
    var tempPlan = [Plan]()
    var tempExerciseDetail = [ExerciseModel]()
    var tempExerciseDetailNext = [ExerciseModel]()
    var tempExerciseDetailPrevious = [ExerciseModel]()
    var idPlanActive : Int!
    var idExercises: [Int]!
    var tempWarningData = [WarningModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        AppUtility.lockOrientation(.landscape)
        circularProgressView.trackClr = UIColor(red: 95/255, green: 104/255, blue: 71/255, alpha: 100)
        circularProgressView.progressClr = UIColor.init(red: 228/255, green: 246/255, blue: 80/255, alpha: 100)
        print(". kok ngga keluar \(finishExercise)")
        setupInit(data: finishExercise)
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(allSummaryTime), userInfo: nil, repeats: true)
       
    }
    

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.all)
        
    }
    
    public func setupInit(data : Int) {
        var warningDatas : String = ""
        // ambil plan active
        self.idExercises = planModelHelpers.fetchExerciseIdByIdPlan(idPlan: idPlanActive)
        print("ini exercise id \(idExercises)")
        
        // ambil exercise detail array [0]
        self.tempExerciseDetail = planModelHelpers.fetchExerciseDetail(idExercise: idExercises![data])
        
        if data < (countChosenExercise-1) {
            self.tempExerciseDetailNext = planModelHelpers.fetchExerciseDetail(idExercise: idExercises![data+1])
        }
            
        if data != 0 {
            print("ini data \(data)")
//            setupInit(data: 0)
            self.tempExerciseDetailPrevious = planModelHelpers.fetchExerciseDetail(idExercise: idExercises![data-1])
            
        }
        
        // ambil warning datanya
        self.tempWarningData = planModelHelpers.fetchIdWarning(idExercise: idExercises![data])
        
        print("ini warning nypba\(tempWarningData.count)")
        for i in 0...(tempWarningData.count - 1) {
            
            warningDatas.append(tempWarningData[i].warningText)
        }
        
        countChosenExercise = idExercises.count
        var countProgress = Float((Float(finishExercise + 1) / Float(countChosenExercise)))
        circularProgressView.setProgressWithAnimation(duration: 1.0, value: (countProgress))
        exerciseView.setProgressNumber(number: (finishExercise + 1), totalExercise: countChosenExercise )
        exerciseView.videoView(dataExercise : tempExerciseDetail, tempWarningData : warningDatas)
        
    }
    
    @IBAction func unwindSegueFromExit(_ sender: UIStoryboardSegue) {}
    
    
    
    @IBAction func informationExercise(_ sender: Any) {
        AppUtility.lockOrientation(.portrait)
        self.performSegue(withIdentifier: "toInformationExercise", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInformationExercise" {
            let destination = segue.destination as! InformationExerciseController
            destination.tempStep = planModelHelpers.fetchIdSteps(idExercise: tempExerciseDetail[0].idExercise)
            destination.tempExerciseDetail = planModelHelpers.fetchExerciseDetail(idExercise: tempExerciseDetail[0].idExercise)
            
        } else if segue.identifier == "toSummary" {
            let destination = segue.destination as! ExerciseSummaryViewController
            
            destination.totalWaktuExercise = countTimeForSummary
            destination.idPlanActive = idPlanActive
        }
    }
    
    @IBAction func previous(_ sender: Any) {
        
        if finishExercise == (countChosenExercise - 1) {
            exerciseView.lastExercise()
        } else if finishExercise == 0 {
            finishExercise = 0
        } else {
            if ((isVideo % 2) != 1) {
                exerciseView.restView(dataExercise : tempExerciseDetailPrevious, number: (finishExercise + 1), totalExercise: countChosenExercise)
                self.navigationController?.navigationBar.isHidden = true
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
                isVideo += 1
            }
            
            
            finishExercise -= 1
            
            
            print("ini next \(finishExercise)")
        }
    }
    
    @IBAction func next(_ sender: Any) {
        print("ini awal next \(finishExercise)")
        if finishExercise == (countChosenExercise - 1) {
            exerciseView.lastExercise()
        } else {
            if ((isVideo % 2) != 1) {
                exerciseView.restView(dataExercise : tempExerciseDetailNext, number: (finishExercise + 1), totalExercise: countChosenExercise)
                self.navigationController?.navigationBar.isHidden = true
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
                isVideo += 1
            }
            finishExercise += 1
            print("ini next \(finishExercise)")
        }
        print(totalWaktuExercise)
    }
    
    @IBAction func doneExercise(_ sender: Any) {
        timer?.invalidate()
        self.performSegue(withIdentifier: "toSummary", sender: nil)
        planHelper.updateTotalSessionDone(idPlan: idPlanActive)
        planHelper.checkPlanIsFinished(idPlan: idPlanActive)
    }
    
    @IBAction func Skip(_ sender: Any) {
        timer?.invalidate()
        count = 30
        exerciseView.countDownView(count: "30")
        
        if finishExercise == countChosenExercise {
            exerciseView.lastExercise()
        } else {
            print("ini skip ya \(finishExercise)")
            setupInit(data: finishExercise)
            isVideo += 1
        }
    }
    
    @IBAction func addTimeRest(_ sender: Any) {
        count += 6
        timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
        countTimeAddition = 5
    }
    
    @IBAction func exit(_ sender: Any) {
        timer?.invalidate()
        self.performSegue(withIdentifier: "tocoba", sender: nil)
        
    
    }
    
    @objc func allSummaryTime() {
        var countString = String(countTimeForSummary)
        countTimeForSummary += 1
    }
    
    @objc func countDownTimer(){
        var countString = String(count)
        if (count == 0 ) {
            timer?.invalidate()
            count = 30
            countString = "3\(countString)"
            exerciseView.countDownView(count: countString)
            setupInit(data: finishExercise)
            isVideo += 1
        }
        if (count >= 0) {
            if count >= 10 {
                exerciseView.countDownView(count: countString)
                
                count -= 1
                print(countString)
            } else {
                countString = "0\(countString)"
                exerciseView.countDownView(count: countString)
                count -= 1
            }
        }
    }
    
    
}
