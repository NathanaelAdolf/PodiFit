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
    
    
    
    
    //reference to moc
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularProgressView.trackClr = UIColor(red: 95/255, green: 104/255, blue: 71/255, alpha: 100)
        circularProgressView.progressClr = UIColor.init(red: 228/255, green: 246/255, blue: 80/255, alpha: 100)
        
        setupInit(data: finishExercise)
        totalWaktuExercise = countChosenExercise * 60
       
    }
    
    public func setupInit(data : Int) {
        var warningDatas : String = ""
        // ambil plan active
        self.idExercises = planModelHelpers.fetchExerciseIdByIdPlan(idPlan: idPlanActive)
        
        // ambil exercise detail array [0]
        self.tempExerciseDetail = planModelHelpers.fetchExerciseDetail(idExercise: idExercises![data])
        
        if data < (countChosenExercise-1) {
            self.tempExerciseDetailNext = planModelHelpers.fetchExerciseDetail(idExercise: idExercises![data+1])
        }
            
            
        if data != 0 {
            self.tempExerciseDetailPrevious = planModelHelpers.fetchExerciseDetail(idExercise: idExercises![data-1])
        }
        
        print("Nama exercise : \(tempExerciseDetail[0].idExercise)")
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
    
    
    
    @IBAction func informationExercise(_ sender: Any) {
        self.performSegue(withIdentifier: "toInformationExercise", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInformationExercise" {
            let destination = segue.destination as! InformationExerciseController
            
            
            destination.tempStep = planModelHelpers.fetchIdSteps(idExercise: tempExerciseDetail[0].idExercise)
            destination.tempExerciseDetail = planModelHelpers.fetchExerciseDetail(idExercise: tempExerciseDetail[0].idExercise)
            
        } else if segue.identifier == "toSummary" {
            let destination = segue.destination as! ExerciseSummaryViewController
            
            destination.totalWaktuExercise = totalWaktuExercise
        }
    }
    
    @IBAction func previous(_ sender: Any) {
        totalWaktuExercise += 60
        if finishExercise == (countChosenExercise - 1) {
            exerciseView.lastExercise()
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
        totalWaktuExercise += 60
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
        self.performSegue(withIdentifier: "toSummary", sender: nil)
    }
    
    @IBAction func Skip(_ sender: Any) {
        totalWaktuExercise -= 30
        timer?.invalidate()
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
        totalWaktuExercise += 5
        timer?.invalidate()
        exerciseView.countDownView(count: "05")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(additionTime), userInfo: nil, repeats: true)
        countTimeAddition = 5
    }
    
    @IBAction func exit(_ sender: Any) {
        timer?.invalidate()
        self.performSegue(withIdentifier: "tocoba", sender: nil)
        
    
    }
    
    @objc func countDownTimer(){
        var countString = String(count)
        if (count == 0 ) {
            setupInit(data: finishExercise)
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
    
    @objc func additionTime(){
        var countStringAdd = String(countTimeAddition)
        
        if (count == 0 ) {
            setupInit(data: finishExercise)
        }
        
        if (countTimeAddition >= 0) {
            if countTimeAddition >= 10 {
                exerciseView.countDownView(count: countStringAdd)
                
                countTimeAddition -= 1
                print(countStringAdd)
            } else {
                countStringAdd = "0\(countStringAdd)"
                exerciseView.countDownView(count: countStringAdd)
                countTimeAddition -= 1
            }
        }

        
    }
    
}
